
/*
written by Michal Piasecki in Processing 0148Beta
 www.michalpiasecki.com
 the function in the if statement, responsible for attraction 
 is a modifidied "attractor" function written by Alasdair Turner
 */

int arrlen = 100; //number of vertexes X and Y
float vertex_e = 6; //vertex edge
float Zdist = 5; //depth of the object
float scope = 100; //scope of operation the attractor (the mouse in this case)
float moveX;
float moveY;

color redish = color(150,0,0);
color black = color(0);
color white = color(255);

float arrX[] = new float[arrlen];
float arrY[] = new float[arrlen];
float arrZ[] = new float[arrlen];

void setup(){
  size(500,500,P3D);
  noFill();
  for(int i = 0; i < arrlen; i++){
    arrX[i] = random((width/arrlen)*i,(width/arrlen)*(i+1));
    arrY[i] = random((width/arrlen)*i,(width/arrlen)*(i+1));
  }
}

void draw(){
  background(black);
  lights();

  for(int i = 0; i < arrlen; i++){
    arrZ[i] = -Zdist*i;
  }

  //draws the vertexes 
  beginShape();
  curveVertex(arrX[0],arrY[0]);
  for(int j = 0; j < arrlen; j++){
    curveVertex(arrX[j],arrY[j]);
    fill(redish);
    noStroke();
    pushMatrix();
    translate(-vertex_e/2,-vertex_e/2);
    rect(arrX[j],arrY[j],vertex_e,vertex_e);
    popMatrix();
    fill(white,100);
    stroke(white,50);   

    if (mousePressed){
      // draws a circle around the attractor - the mouse
      pushMatrix();
      translate(mouseX,mouseY);
      for(int t = 0; t < 100; t++){
        pushMatrix();
        translate(scope,0);
        point(0,0);
        popMatrix();
        float deg = 360/50;
        float rad = radians(deg);
        rotate(rad);
      }
      fill(white,100);
      popMatrix();
      if (dist(arrX[j], arrY[j], mouseX, mouseY) < scope){
        float d = dist(arrX[j], arrY[j], mouseX, mouseY);
        float diffX = mouseX - arrX[j];
        float diffY = mouseY - arrY[j];
        moveX += diffX / sq(d);
        moveY += diffY / sq(d);

        if(arrX[j] < 0 || arrX[j] > width){
          arrX[j] = random((width/arrlen)*j,(width/arrlen)*(j+1));
        } 
        else if (arrY[j] < 0 || arrY[j] > height){
          arrY[j] = random((width/arrlen)*j,(width/arrlen)*(j+1));
        }
        else{
          arrX[j] += moveX;
          arrY[j] += moveY;
        }   
      }
    }
  }
  curveVertex(arrX[arrlen-1],arrY[arrlen-1]);
  endShape();

  //3d surface creation
  beginShape(QUAD_STRIP);
  for(int g = 0; g < arrlen-2; g++){
    for(int f = 0; f < arrlen; f++){
      vertex(arrX[f],arrY[f],arrZ[g]);
      vertex(arrX[f],arrY[f],arrZ[g+1]);
    }
  }
  endShape();
}

void keyPressed(){
  if (key == 'q' || key == 'Q'){
    Zdist += 1;
  }
  else if (key == 'w' || key == 'W'){
    Zdist -= 1;
  }
  else if (key == 'a' || key == 'A'){
    scope += 10;
  }
  else if (key == 's' || key == 'S'){
    scope -= 10;
  }
}


