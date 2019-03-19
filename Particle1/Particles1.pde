/*
Title : System of particles class
*/
import java.util.*;
class Particles{

  ArrayList<Particle> particles;
  PVector origin;
  PImage img;
  
  /* create a system of particles
  @Param image corresponds to a render of each particle*/
   Particles(PVector origin_, PImage img_){
    particles=new ArrayList<Particle>();
    origin=origin_.get();
    img=img_;
  }
  
  
  /* add a particle to the system*/
  void add(){
    Random generator=new Random(); 
    float vx = (float) generator.nextGaussian()*0.05;
    float vy = (float) generator.nextGaussian()*0.3 - 1.0;
    PVector location= new PVector(origin.x+vx,origin.y+vy);
    particles.add(new Particle(location,img));
  }

  
  /* update each particles position, and remove those which are dead*/
  void process(){
    for(int i=particles.size()-1; i>0;i--){
      Particle p=particles.get(i);
      p.update();
      if(p.isDead()){
        particles.remove(i);
      }else{
        p.display();
      }
    }
  }
  
  
  /* return the number or particles in the system*/
  int size(){
    return particles.size();
  }
  
  /* apply Force to each particle */
  void applyForce(PVector force){
    for(Particle p:particles){
      p.applyForce(force);
    }
  }
  
  /* apply a resistance to each particle */
  void applyDragForce(float c){
    for(Particle p:particles){
      p.applyDragForce(c);
    }
  }

 /*Move the origin of the system upward of vector v*/
   void moveOriginUpward(PVector v){
     origin.add(v);
  }
  
  void setOrigin(PVector v){
    origin=v;
  }
  
  
}
