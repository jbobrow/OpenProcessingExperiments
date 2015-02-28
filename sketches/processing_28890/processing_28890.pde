
class Boy extends Sprite{
  float radius;
  float a,b;
  float speed = 0;
  float width = 2.5;
  float height = 3;
  float depth = 2.5;
  float ob,oa;
  PImage txt;
  Emotion emotion;
  Boy(float r){
    emotion = new Emotion();
    txt = loadImage(dataPath("boy.jpg"));
    radius = r+this.height/2.0;
  }

void showSmile(int id){
 emotion.showSmile(id); 
}
  void draw(){
    this.x = cos(a)*radius*cos(b);
    this.z = cos(a)*radius*sin(b);
    this.y = sin(a)*radius;  
    lookAt(center);
    pushMatrix();
    applyMatrix(_transform.sxx,_transform.sxy,_transform.sxz,x,_transform.syx,_transform.syy,_transform.syz,y,_transform.szx,_transform.szy,_transform.szz,z,0.0f,0.0f,0.0f,1.0f);
    scale(width,depth,height);
    rotateX(HALF_PI);
    rotateZ(.2f*sin((float)frameCount/6.0f));
    

    rotateY(rotationY+PI);
    beginShape(QUADS);
    texture(txt);
    // +Z "front" face
    vertex(-1, -1,  1, 0, 0);
    vertex( 1, -1,  1, .2, 0);
    vertex( 1,  0,  1, .2, .5);
    vertex(-1,  0,  1, 0, .5);

    // -Z "back" face
    vertex( 1, -1, -1, 0.4, 0);
    vertex(-1, -1, -1, .6, 0);
    vertex(-1,  0, -1, .6, .5);
    vertex( 1,  0, -1, .4, .5);

    // +Y "bottom" face
    vertex(-1,  0,  1, 0.8, 0);
    vertex( 1,  0,  1, 1, 0);
    vertex( 1,  0, -1, 1, .5);
    vertex(-1,  0, -1, .8, .5);

    // -Y "top" face
    vertex(-1, -1, -1, 0.8, 0);
    vertex( 1, -1, -1, 1, 0);
    vertex( 1, -1,  1, 1, .5);
    vertex(-1, -1,  1, 0.8, .5);

    // +X "right" face
    vertex( 1, -1,  1, 0.2, 0);
    vertex( 1, -1, -1, .4, 0);
    vertex( 1,  0, -1, .4, .5);
    vertex( 1,  0,  1, 0.2, .5);

    // -X "left" face
    vertex(-1, -1, -1, 0.6, 0);
    vertex(-1, -1,  1, .8, 0);
    vertex(-1,  0,  1, .8, .5);
    vertex(-1,  0, -1, 0.6, .5);
    
    
    
    
      // +Z "front" face
    vertex(-.5, 0,  .5, 0, 0.5);
    vertex( .5, 0,  .5, .2, 0.5);
    vertex( .5,  1,  .5, .2, 1);
    vertex(-.5,  1,  .5, 0, 1);

    // -Z "back" face
    vertex( .5, 0, -.5, 0.4, 0.5);
    vertex(-.5, 0, -.5, .6, 0.5);
    vertex(-.5,  1, -.5, .6, 1);
    vertex( .5,  1, -.5, .4, 1);

    // +Y "bottom" face
    vertex(-.5,  0,  .5, 0.8, 0.5);
    vertex( .5,  0,  .5, 1, 0.5);
    vertex( .5,  0, -.5, 1, 1);
    vertex(-.5,  0, -.5, .8, 1);

    // -Y "top" face
    vertex(-.5, 0, -.5, 0.8, 0.5);
    vertex( .5, -0, -.5, 1, 0.5);
    vertex( .5, -0,  .5, 1, 1);
    vertex(-.5, -0,  .5, 0.8, 1);

    // +X "right" face
    vertex( .5, -0,  .5, 0.2, 0.5);
    vertex( .5, -0, -.5, .4, 0.5);
    vertex( .5,  1, -.5, .4, 1);
    vertex( .5,  1,  .5, 0.2, 1);

    // -X "left" face
    vertex(-.5, -0, -.5, 0.6, 0.5);
    vertex(-.5, -0,  .5, .8, 0.5);
    vertex(-.5,  1,  .5, .8, 1);
    vertex(-.5,  1, -.5, 0.6, 1);

    //   box(width,depth,height);
    endShape();
    
    emotion.draw();
    
    popMatrix(); 

    oa = a;
    ob = b;
  }



}






