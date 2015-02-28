
String letters = "";
color back = color(0);

void setup() {
  size (500,500);
  textAlign (LEFT);
  //below 4 lines from online
  size(500,500);
  smooth();
  background(0);
  noFill();

}

void draw () {
  //background (back);
  text(letters,5,15);
}
void keyPressed () {
  if ((key==ENTER) || (key == RETURN)) {
    letters = letters.toLowerCase();
   println(letters);
   
   if (letters.equals("a")){
  
   //blelow borrowed from online
     translate(width/2,height/2);
  for (int i=0;i<360;i+=40)
  { //premiere rotation (triangles)
    rotate(radians(40));
    stroke(255,100);
    strokeWeight(8);
    triangle(20, 100, 100, 20, 100, 100);
    }

   }
   
   if (letters.equals("b")) {
     noFill();
    strokeWeight (2);
    ellipse (250,250,250,250);
   }
   
   if (letters.equals("c")) {
     translate(width/2,height/2);
       for (int i=0;i<360;i+=10)
  {
    rotate(radians(10));
    strokeWeight(2);
    stroke(255,90);
   line(50,50,100,100);
  }
   }
  
   if (letters.equals("d")) {
     translate(width/2,height/2);
  for (int i=0;i<360;i+=5)
     {
       rotate(radians(5));
       strokeWeight(4);
      stroke(255,90);
       line(50,100,100,100);
     }
   }
     
    if (letters.equals("e")){
     //back=color(150,50,10);
     translate(width/2,height/2);
  for (int i=0;i<360;i+=40)
  { //deuxième rotation
    rotate(radians(40));
    stroke(255,90);
    strokeWeight(2);
    triangle(10,10,50,0,25,43);
  
    }

   }
   
  if (letters.equals("f")) {
    translate(width/2,height/2);
  for (int i=0;i<360;i+=5)
  { //premiere rotation
    rotate(radians(5));
    strokeWeight(4);
    stroke(255,90);
   line(100,100,150,150);

   }
  }
   
   
  if (letters.equals("g")) {
    translate(width/2,height/2);
  for (int i=0;i<360;i+=20)
  { //premiere rotation de rectangles
    rotate(radians(20));
    strokeWeight(4);
    stroke(255,90);
   rect(70,70,80,80);
  }
  }
  
  if (letters.equals("h")) {
    translate(width/2,height/2);
     for (int i=0;i<360;i+=20)
  { 
    rotate(radians(20));
    strokeWeight(10);
    stroke(255,80);
   rect(5,5,150,150);
  }
  }
  
  if (letters.equals("i")) {
    translate(width/2, height/2);
    for (int i=0;i<360;i+=10){
    rotate(radians(20));
    strokeWeight (2);
    ellipse(100,100,40,40);
    }
  }
  
  
  if (letters.equals("j")) {
    translate(width/2,height/2);
    for (int i=0;i<360;i+=10)
  {
    rotate(radians(10));
    stroke(255,90);
    strokeWeight(4);
    triangle(1,0,100,100,10,10);
  }
  }
  
  if (letters.equals("k")) {
    translate(width/2,height/2);
      for (int i=0;i<360;i+=20)
  { 
    rotate(radians(20));
    stroke(255,90);
    strokeWeight(10);
   triangle(100,100,200,100,100,200);
  }
  }
  
  if (letters.equals("l")) {
    translate(width/2,height/2);
   for (int i=0;i<360;i+=20)
  { 
    rotate(radians(20));
    stroke(255,90);
    strokeWeight(3);
    triangle(0,0,200,0,0,200);
 }
  }
  
 if (letters.equals("m")) {
  translate(width/2, height/2);
  for (int i=0;i<360;i+=30){
  rotate(radians(30));
  stroke(255,90);
  strokeWeight(5);
  quad(0, 0, 2, 15, 70, 60, 20, 60);
}
  }

  
  if (letters.equals("n")) {
  translate(width/2, height/2);
  for (int i=0;i<360;i+=30){
    
  rotate(radians(30));
  stroke(255,90);
  strokeWeight(3);
  quad(110, 0, 20, 15, 10, 60, 20, 60);
}
  }
    
    
  if (letters.equals("o")) {
    translate(width/2, height/2);
  for (int i=0;i<360;i+=10){
  rotate(radians(20));
  strokeWeight (1);
  ellipse(100,100,20,20);
   }
   }
   
   
 if (letters.equals("p")) {
    noFill();
    strokeWeight (3);
    ellipse (250,250,350,350);
 }
   
if (letters.equals("q")) {
    translate(width/2,height/2);
    for (int i=0;i<360;i+=30)
    {
    rotate(radians(30));
    strokeWeight(3);
    stroke(255,90);
    arc(100,100, 200, 200, HALF_PI, PI+HALF_PI);
    }
  }
   
   
  if (letters.equals("r")) {
    translate(width/2, height/2);
  for(int i=0; i<360; i+=30)
  {
  rotate(radians(30));
  stroke(255,90);
  strokeWeight(2);
  line(0,0,150,150);
  //fill(0);
  triangle(150,150,154,151,150,155);
}
  }
 
 if (letters.equals("s")) {
    translate(width/2,height/2);
  for (int i=0;i<360;i+=20)
  { //premiere rotation de rectangles
    rotate(radians(20));
    strokeWeight(4);
    stroke(255,90);
   rect(10,10,80,80);
  }
 }
   
  if (letters.equals("t")) {
      translate(width/2,height/2);
    for (int i=0;i<360;i+=10)
  {
    rotate(radians(10));
    stroke(255,90);
    strokeWeight(5);
    triangle(50,0,100,100,0,50);
  }
  }
    
  if (letters.equals("u")) {
    translate(width/2, height/2);
    for (int i=0;i<360;i+=30){
      strokeWeight (2);
    rotate(radians(30));
    quad(0, 0, 2, 15, 70, 60, 20, 60);
}
  }
  
  if (letters.equals("v")) {
       translate(width/2,height/2);
      for (int i=0;i<360;i+=30)
  {
    rotate(radians(30));
    strokeWeight(20);
    stroke(255,100);
    arc(50, 50, 90, 90, 0, PI);
  }
  }
  
  if (letters.equals("w")) {
    
    translate(width/2,height/2);
    for (int i=0;i<360;i+=20)
  {
    rotate(radians(20));
     stroke(255,90);
     strokeWeight(2);
    ellipse(0,0,10,470);
  }
  }

  if (letters.equals("x")) {
    noFill();
    strokeWeight (3);
    ellipse (250,250,150,150);
   }
   
  if (letters.equals("y")) {
    translate(width/2, height/2);
    for (int i=0;i<360;i+=30)
    {
    strokeWeight(4);
    rotate(radians(30));
    rectMode(CENTER);
    rect(0,90,140,140);
 }
  }
  
 if (letters.equals("z")) {
    translate(width/2, height/2);
    for (int i=0;i<360;i+=30){
  rotate(radians(30));
  triangle(90,230,20,170,160,170);
}
 }
 
   
   letters="";
  }
  else if ((key>31) && (key !=CODED)) {
    letters = letters+key;
  }
  


}



