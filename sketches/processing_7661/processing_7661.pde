
class Button{

  float x;
  float y;
  float t;
  float z;
  float b;
  float s=random(4);
  float s2=random(5);
  float g= 0.1;  
  float g2= 0.1;  


  Button(float tempX, float tempY, float tempT, float tempZ,float tempB){

    x=tempX=random(width);
    y=tempY=random(height);
    b=tempB=random(500);

    z=tempZ=70;
    t=tempT=70;

  }


  void display(){

    x=x+s;
    y=y+s2;

    way=way+0.001;
    float n = noise((way)*noiseRange, way*noiseRange);

    noStroke();
    pushMatrix();

    translate(x,y,-b);
    //tint(255,255,255,100);
    beginShape(TRIANGLES);
    rotateX(way/2);
    rotateY(way/4);
    rotateZ(way/6);
    texture(a);
    vertex(0,-t,0*n,0,0);//1
    vertex(-t,t,0*n,1,0);//2
    vertex(t,t,0*n,1,1);
    endShape();

    beginShape();
    texture(a);
    vertex(0,-t,-z*n,0,0);//4
    vertex(-t,t,-z*n,1,0);//3
    vertex(t,t,-z*n,1,1);
    endShape(CLOSE);




    beginShape();
    texture(a);
    vertex(0,-t,0*n,0,0);
    vertex(-t,t,0*n,0,1);
    vertex(-t,t,-z*n,1,1);
    vertex(0,-t,-z*n,0,1);
    endShape();


    beginShape();
    texture(a);
    vertex(0,-t,0*n,0,0);
    vertex(t,t,0*n,0,1);
    vertex(t,t,-z*n,1,1);
    vertex(0,-t,-z*n,1,0);
    endShape();


    beginShape();
    texture(a);
    vertex(-t,t,0*n,0,0);
    vertex(t,t,0*n,0,1);
    vertex(t,t,-z*n,1,1);
    vertex(-t,t,-z*n,1,0);


    endShape(CLOSE);


    popMatrix();



    if(x<0-500 || x>width+500){
      s=s*-1;

    }


    if(y<0-500 || y>height+500){
      s2=s2*-1;


    }



    stroke(255,5,255,50);
    //line(x,y,width,0);
    tail.lock();
   // head.lock();
    // head.set(y,x);
    head.set(x,y);
   // head.set(500-width/2,500-height/2);
 //  head.set(mouseX,mouseY);

    physics.update();
    strokeWeight(10);
    beginShape();
    noFill();
    for(Iterator d=physics.particles.iterator(); d.hasNext();) {
      VerletParticle2D p=(VerletParticle2D)d.next();

      stroke(p.x,p.y,0,150);

      // stroke(0,0,0,170);
      vertex(p.x,p.y,-b);
    }
    endShape();



  }

}
























