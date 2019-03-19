/*
Title : A moving particle class of mass m=1

*/

class Particle{
  PVector location; 
  PVector velocity;
  PVector acceleration; 
  float lifespan; //life duration of the particle
  PImage img;
  
  
  /* create a particle moving 
  @Param image corresponds to a render of the particle */
  Particle(PImage img_){
    location=new PVector(width/2,height);
    velocity=new PVector(0,random(-3.5,-3)); 
    acceleration=new PVector(0,random(2,3)); //for a deceleration, acceleration.y< velocity.y
    lifespan=random(150,300);
    img=img_;
  }
  

  /* @Param l corresponds to the location of the particle to create
  @Param image corresponds to a render of the particle */
  Particle(PVector l, PImage img_){
    location=l.get();
    velocity=new PVector(0,random(-3.5,-3)); 
    acceleration=new PVector(0,random(2,3));
    lifespan=90;
    img=img_;
  }
  
  
  /*update the particle velocity and location */
  void update(){
     velocity.add(acceleration);
     location.add(velocity);
     acceleration.mult(0); //calculate the acceleration at each instant
     lifespan-=4;
  }
  
  
  /* @return true if the particle is dead, else return false */
  boolean isDead(){
    return(lifespan<=0);
  }
  
  
  void display(){
    imageMode(CENTER);
    tint(255,lifespan);
    image(img,location.x,location.y,70,70); //here to change image size
  }
  
  
  /* apply a force to the particle*/
  void applyForce(PVector force){
    acceleration.add(force);
  }
  
  /* apply a drag force to the particle
  @Param c : coefficient of resistance */
   void applyDragForce(float c){
     PVector dragForce=velocity.get();
     dragForce.normalize();
     float speedSq=velocity.magSq();
     dragForce.mult(-abs(c)*speedSq);
     acceleration.add(dragForce);
  }
  
  
  /* change the location of the particle to loc */
  void setLocation(PVector loc){
    location=loc.get();
  }
  
  /* change the life span of the particle to ls */
  void setLifeSpan(float ls){
    lifespan=ls;
  }

}
