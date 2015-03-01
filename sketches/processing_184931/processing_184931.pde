
//Austin S Lee 8Feb15
//Array Button Example2

PImage img0;
PFont font;

Menu[] menu= new Menu[6];
int menuX, menuY, menuW, menuH;

//int index=0;
int[] index= new int[6];
int indexFin;

void setup(){
  size(1038, 651);
  img0= loadImage("frontFrame.png");
  menuX= 100; //original
  menuY= 10;   //original
  menuW= 31;
  menuH= 31;
  
  font= createFont("Helvetica-Bold",120);
    
}
void draw(){
  background(0);
  image(img0, 0,0);
  for (int l=0; l< menu.length; l++) {
    menuX= 937; 
    menuY= 157+l*45;
    menuW= 33;
    menuH= 33;
    menu[l]= new Menu(menuX, menuY, menuW, menuH);
  }
  for (int i=0; i< menu.length; i++) {
    menu[i].rollover(mouseX, mouseY);
    menu[i].update();
    menu[i].display();
   
  }
   fill(255);
   textAlign(CENTER);
   textFont(font);
   text(""+indexFin, width/2, height/2);
  
  
  
  
}
void mousePressed() {
  for (int n=0; n<menu.length; n++) {
     if(mouseX> menuX-menuW/2&& mouseX<menuX+menuW/2 && 
    mouseY>= 157+(45*n)-menuH/2 && mouseY<= 157+(45*n)+menuH/2){
     index[n]=n;
     indexFin= index[n];
    }
//    if(mouseX> menuX-menuW/2&& mouseX<menuX+menuW/2 && 
//    mouseY>= 157-menuH/2 && mouseY<= 157+menuH/2){
//     index=0;
//    }else if(mouseX> menuX-menuW/2&& mouseX<menuX+menuW/2 && 
//    mouseY>= 157+45-menuH/2 && mouseY<= 157+45+menuH/2){
//      index=1;
//    }else if(mouseX> menuX-menuW/2&& mouseX<menuX+menuW/2 && 
//    mouseY>= 157+45*2-menuH/2 && mouseY<= 157+45*2+menuH/2){
//      index=2;
//    }else if(mouseX> menuX-menuW/2&& mouseX<menuX+menuW/2 && 
//    mouseY>= 157+45*3-menuH/2 && mouseY<= 157+45*3+menuH/2){
//      index=3;
//    }else if(mouseX> menuX-menuW/2&& mouseX<menuX+menuW/2 && 
//    mouseY>= 157+45*4-menuH/2 && mouseY<= 157+45*4+menuH/2){
//      index=4;
//    }else if(mouseX> menuX-menuW/2&& mouseX<menuX+menuW/2 && 
//    mouseY>= 157+45*5-menuH/2 && mouseY<= 157+45*5+menuH/2){
//      index=5;
//    }
    println(index);
 
  
  }
  
  
  

}


class Menu{
  
  PVector location; //menu position
  PVector size; // menu size(width and height)
  int locX, locY, xSize, ySize; 
  boolean mouse; // check rollOver
  boolean clicking= false; //
  
  Menu(int x, int y, int w, int h){

    location= new PVector(x,y);
    size= new PVector(w,h);
    mouse= false;
  }
  
  void update(){
  }
  
  void display(){
    noStroke(); //test
    fill(10,255,255,200);
    ellipseMode(CENTER);
    ellipse(location.x, location.y, size.x, size.y);
    
    if(mouse){ //mouse
      stroke(255,255,255);
      strokeWeight(1.5); //1.5
      ellipse(location.x, location.y, size.x, size.y);
    }
    if(clicking){
      rect(100,100,100,100);
    }
    
  }
  
  void rollover(int mx, int my){
    if(mx> location.x- size.x/2&& mx<location.x+size.x/2 
    && my>= location.y-size.y/2 && my<= location.y+size.y/2){
      mouse= true;
    }else{
      mouse= false;
    }
  }


}


