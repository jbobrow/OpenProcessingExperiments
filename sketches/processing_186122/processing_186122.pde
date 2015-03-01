
//Austin S Lee 8Feb15
//Array Button Example2
//Devin Spear, tweak of Array Button by Austin Lee. AIS. 16Feb15

//Create an array of images
PImage img0;

//Class + #of images
PImage[] imageName= new PImage[7];

//Class font
PFont font;
PFont font1;
PFont font2;



//Menu Array, #of buttons, integer
Menu[] menu= new Menu[7];
int menuX, menuY, menuW, menuH;  


//Integer Array, #of integers, indexFin class
int[] index= new int[7];
int indexFin;

//Set screen size + load tablet image
void setup(){
  size(1038, 651);
  img0= loadImage("frontFrame.png");
  menuX= 100; //original
  menuY= 10;   //original
  menuW= 31;
  menuH= 31;
  
  font= createFont("IMFeFCsc28P.tff",100);
  font1= createFont("Play-Regular.ttf",26);
  font2= createFont("Play-Bold.ttf",26);
  
    for(int i=0; i<imageName.length; i++){
    imageName[i]= loadImage("imageName"+i+".jpg");
   
  }
    
}


void draw(){
  background(255);
  image(img0, 0, 0);
  for (int l=0; l< menu.length; l++) {
    menuX= 937; 
    menuY= 157+l*45; 
    menuW= 33;
    menuH= 33;
    menu[l]= new Menu(menuX, menuY, menuW, menuH);
    
    menu[l].rollover(mouseX, mouseY);
    menu[l].update();
    menu[l].display();
    
  }
   fill(255,0,0);
   textAlign(CENTER);
   textFont(font);
   text(""+indexFin, 170, 200);
   //text(""+indexFin, width/2, height/2);
   

  
  if(indexFin==0){
    fill(0);
    textFont(font2);
    text("Shorts",200,190);
  }
  else if (indexFin==1){
    fill(0);
    textFont(font2);
    text("Under Shirt",200,190);
  }
  else if (indexFin==2){
    fill(0);
    textFont(font2);
    text("Jeans",200,190);
  }
  else if (indexFin==3){
    fill(0);
    textFont(font2);
    text("Shirt",200,190);
  }
  else if (indexFin==4){
    fill(0);
    textFont(font2);
    text("Socks",200,190);
  }
  else if (indexFin==5){
    fill(0);
    textFont(font2);
    text("Belt",200,190);
  }
   else if (indexFin==6){
    fill(0);
    textFont(font2);
    text("Shoes",200,190);
  }
  
   image(imageName[indexFin], width/2-250, height/2-247, 500,500);

  
}
void mousePressed() {
  for (int n=0; n<menu.length; n++) { 
     if(mouseX> menuX-menuW/2&& mouseX<menuX+menuW/2 && 
    mouseY>= 157+(45*n)-menuH/2 && mouseY<= 157+(45*n)+menuH/2){
  
     indexFin= n;
    }
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
    fill(237,237,17,200);
    ellipseMode(CENTER);
    ellipse(location.x, location.y, size.x, size.y);

    
    if(mouse){ //mouse
      fill(255,0,0);
      noStroke();
      strokeWeight(1.5); //1.5
      ellipse(location.x, location.y, size.x, size.y);
    }
//    if(clicking){
//      rect(100,100,100,100);
//    }
    
  }
  
  

  
  void rollover(int mx, int my){
    if(mx> location.x- size.x/2 && mx<location.x+size.x/2 
    && my>= location.y-size.y/2 && my<= location.y+size.y/2){
      mouse= true;
    }else{
      mouse= false;
    }
  }


}


