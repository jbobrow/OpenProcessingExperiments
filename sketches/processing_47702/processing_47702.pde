
PImage beer; 
PImage cali;
PFont gothic;
//Location[] locations; //declare object array
String[] data;//declare data array for parsed file
//BufferedReader btype;
//String brtype;



void setup(){
  size(650,650);
  smooth();
  gothic = loadFont("gothic.vlw");
  beer = loadImage("beerbottle.png");
  cali = loadImage("cali.png");
  data = loadStrings("beer.txt");
  //btype = createReader("beer.txt");
  //locations = new Location[data.length];
  
}

void draw(){
  beeya();
  
}


void beeya(){
  //image(beer,0,0);
  background(0);
 for(int i = 0; i < data.length; i++){
   String[] pieces = split(data[i],TAB);
  
  
   
   float x = parseFloat(pieces[3]);
   String y = pieces[1];
   float a = parseFloat(pieces[4]);
   float b = parseFloat(pieces[5]);
   
     x = map(x, 0, 20, 0, 600);
    image(beer,a,b,x,x);
   
    //locations[i] = new Location(x,y,pieces[0]);

   // println (z);
   
   float s = parseFloat(pieces[6]);
   String z = pieces[2];
   
    println (i);
    fill(255);
    
    if (dist(mouseX,mouseY,a,b) < 15){
   
    fill(255);
    textFont(gothic,20);
    text(y,210,100);
    
    
   } else {
     strokeWeight(0);
     fill(255,81,0);
     ellipse(a,b,15,15);
   }
  // if (brtype == null){
     
   
   if (mousePressed == true && dist(mouseX,mouseY,a,b)<15) {
    //for(int z;
    //pushMatrix();
 // translate(10,-420);
  fill(173,247,255);
    textFont(gothic,15);
    text(z,350, s*30 + 150);
  //popMatrix();
     
  } else {
    fill(0);
  }
  
   
  }
}



