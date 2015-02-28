
Snow MySnow1;
Snow MySnow2;
Snow MySnow3;
Snow MySnow4;
Snow MySnow5;
Snow MySnow6;
Snow MySnow7;
Snow MySnow8;
Snow MySnow9;
Snow MySnow10;
Snow MySnow11;
Snow MySnow12;
Snow MySnow13;
Snow MySnow14;
Snow MySnow15;
Snow MySnow16;
Snow MySnow17;
Snow MySnow18;
Snow MySnow19;
Snow MySnow20;


void setup(){
  size(600,600);
  background(0);
  frameRate(5);
MySnow1 = new Snow(color(255),0,600,5);
MySnow2 = new Snow(color(254),600,0,5);
MySnow3 = new Snow(color(251),556,319,5);
MySnow4 = new Snow(color(254),28,35,5);
MySnow5 = new Snow(color(255),555,81,5);
MySnow6 = new Snow(color(252),191,49,5);
MySnow7 = new Snow(color(253),309,404,5);
MySnow8 = new Snow(color(254),490,99,5);
MySnow9 = new Snow(color(255),8,555,5);
MySnow10 = new Snow(color(253),400,259,5);
MySnow11 = new Snow(color(252),199,300,5);
MySnow12 = new Snow(color(251),222,45,5);
MySnow13 = new Snow(color(250),500,234,5);
MySnow14 = new Snow(color(251),333,514,5);
MySnow15 = new Snow(color(254),95,299,5);
MySnow16 = new Snow(color(253),218,309,5);
MySnow17 = new Snow(color(251),150,6,5);
MySnow18 = new Snow(color(255),69,89,5);
MySnow19 = new Snow(color(254),200,198,5);
MySnow20 = new Snow(color(251),20,450,5);

  
}


void draw(){
  if(mousePressed) {            //wolf's eyes are seen
    fill(255,0,0);      
    ellipse(300,300,width,height);
    ellipse(320,300,width,height);
  }
  
    
fill(255);
MySnow1.move();
MySnow1.display();
MySnow2.move();
MySnow2.display();
MySnow3.move();
MySnow3.display();
MySnow4.move();
MySnow4.display();
MySnow5.move();
MySnow5.display();
MySnow6.move();
MySnow6.display();
MySnow7.move();
MySnow7.display();
MySnow8.move();
MySnow8.display();
MySnow9.move();
MySnow9.display();
MySnow10.move();
MySnow10.display();
MySnow11.move();
MySnow11.display();
MySnow12.move();
MySnow12.display();
MySnow13.move();
MySnow13.display();
MySnow14.move();
MySnow14.display();
MySnow15.move();
MySnow15.display();
MySnow16.move();
MySnow16.display();
MySnow17.move();
MySnow17.display();
MySnow18.move();
MySnow18.display();
MySnow19.move();
MySnow19.display();
MySnow20.move();
MySnow20.display();

}

void keyPressed(){              //wolf's footprints are seen
  if (key == 'w'){
    background(255);    
    fill(0);
    ellipse(300,435,50,50);
    ellipse(300,300,50,50);
    ellipse(380,259,50,50);
    ellipse(380,370,50,50);
  }
}

class Snow{
  float xpos;
  float ypos;
  float yspeed;

MySnow(float SnowXpos, float SnowYpos, float SnowYspeed){
  xpos = SnowXpos;
  ypos = SnowYpos;
  yspeed = SnowYspeed;
  }
}
void display(){
  ellipse(xpos,ypos,10,10);  
}


void move(){
  xpos= x+1;
  
}
