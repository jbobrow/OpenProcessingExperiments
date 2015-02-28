
int hair;
boolean rain=false;
int faceX;
int faceY;
int i;
int j;
int x;
int y;
float hairSize;
void setup(){
  size(2560,1440);
  background(224,32,32);
  noStroke();
  shapeMode(CENTER);
  noLoop();
  ellipseMode(RADIUS);
}

void draw(){
  background(224,32,32);
  makeItRain();
  drawBody();
  fill(246,193,177);

  rect(200,193,width/9, height/5,50);//make face
  fill(131,81,30);
  rect(200, 275,width/9,40 );//make eyes
 


  fill(250,99,76);

  ellipse(width/7.5,400,40,15);//make mouth
 // curve(175, 300, 175, 300, 175, 300, 225, 300);
  puff();
  drawCircle();
  words();

  


  println(width+"w");
  println(height+"h");
  
}
void makeItRain(){

  if(rain==true){
    fill(88,98,198);
    for(int x=0;x<2560;x=x+110){
        //quad(50+x,50,100+x,100,50+x,200,0+x,100);
        quad(0+x,50,25+x,100,50+x,50,25+x,25);
            for(int y=0;y<1440;y=y+150){
                quad(0+x,50+y,25+x,100+y,50+x,50+y,25+x,25+y);
             }
    }

  }

}
void words(){
  if(rain==true){
    PFont arbonnie;

    arbonnie = loadFont("ARBONNIE-60.vlw");
    textFont(arbonnie);
    textSize(60);
    fill(188, 160, 19);
    //strokeWeight(50);
   // line(280,305,300,285);
    //line(300,285,320,305);
    //line(320,305,300,285);
    //triangle();
    text("^", 333, 330); 
    textSize(40);
    text("_", 336, 307); 
  }
}
public void puff(){

  if(rain==true){
    hair=45;
  } else{
    hair=8;
  }
  
}
void drawBody(){
  fill(random(255), random(255), 0);
  ellipse(width/7.5,410+height/5, 20+random(20),400+random(100));
  ellipse(width/7.5,410+height/5, 20+random(20),400+random(100));
  ellipse(width/7.5,410+height/5, 20+random(20),400+random(100));
  ellipse(width/7.5,410+height/5, 20+random(20),400+random(100));
  ellipse(width/7.5,410+height/5, 20+random(20),400+random(100));
  while(i<30+random(30)){
  fill(random(255), random(255), 0);
  ellipse(width/7.5,410+height/5, 20+random(20),400+random(100));
  i++;

  }
}
void drawCircle(){
  faceX=200;
  faceY=200;
  
  while ((faceY>=200-height/5)&&(faceY<=250+height/5)){//sides of head
    fill(random(255), random(255), random(255));//color
   // hairSize=random(10);
    ellipse(faceX, faceY, hair, hair);//leftside
    ellipse(faceX+width/9, faceY, hair, hair);//rightside

    
    
    faceY=faceY+5;
    println(faceY+"afterincrease");
    //increase to itterate
  }
  faceY=200;
  while ((faceY>=200-height/5)&&(faceY<=400)){
      fill(random(255), random(255), random(255));
      println(faceY+"curl");
      ellipse(260, faceY, 7, 7);
      faceY=faceY+5;
//make hanging curl!!!
  }
  faceY=200;//reset
  while((faceX<=200+width/9)&&(faceX>=200)){//top of head
    fill(random(255), random(255), random(255));//color
    //hairSize=random(10);
   ellipse(faceX, faceY, hair, hair);//top
    faceX=faceX+5;//increase to itterate
    println(faceX);
  }
}
void mousePressed() {

 drawBody();
 rain ^= true;
  redraw();
}



