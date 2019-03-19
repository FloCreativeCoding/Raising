/*Main file
Run this file. On mouse click, the systems will slow down*/

ArrayList<Particles> particleSystList;

void settings(){
   size(1000,500,P2D);
}

void setup(){
  particleSystList=new ArrayList<Particles>(); 
  
  //load image of a particle
  PImage img=loadImage("blue.png");
  
  //initialize a list of Particle systems
  int nbParticleSyst=15;
  for(int i=0; i<nbParticleSyst;i++){
    PVector origin=new PVector(random(0,width),random(height/6,height+20));
    particleSystList.add(new Particles(origin,img));
  }
}

void draw(){
  background(0);
  blendMode(ADD);
  
  PVector gravi=new PVector(0,0.8); //gravitational force
  PVector step=new PVector(0,-0.8); //to move the all system up
  
  for(Particles ps: particleSystList){
    //add a particle in each system
    if(ps.size()<500){
      ps.add();
    }
    
    ps.applyForce(gravi);
    ps.moveOriginUpward(step);
    
    ps.process();
    
  }
  
  /*a deceleration force is applied to the whole system*/
  if(mousePressed){ 
    PVector decForce=new PVector(0,0.6); //deceleration force on the global system
    for(Particles ps: particleSystList){
      ps.moveOriginUpward(decForce);
    }

  }


}
