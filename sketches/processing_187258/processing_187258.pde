
int x = 320; // x-position 
int y = 240; // y-position
float xIntheBox;
float yIntheBox;

void setup(){
    background (140,200,255);
    size(640,480);
    println("Setup Done!");
    frameRate(60);
}

void draw(){
    noStroke();
    rectMode(CENTER);
    background(mouseX%255,mouseX&250,mouseY&250);
    fill (220,0,0);
    rect (x,y,100,100);        //head
    fill (220,0,0);
    rect (x+50,y,5,40);        //Right ear
    fill (220,0,0);
    rect (x-50,y,5,40);        //Left ear
    fill (220,0,0);
    rect (x,y-60,5,75);        //Antenna
    fill (220,0,0);
    ellipse (x,y-100,18,6);       //Antenna Tip
    fill (mouseY%250,mouseY%250,mouseX%250);
    ellipse (x-25,y,10,10);       //Left Eye **************
    fill (mouseY%250,mouseY%250,mouseX%250);
    ellipse (x+25,y,10,10);       //Right Eye *************
    fill (mouseY%250,mouseX%250,mouseY%250);
    rect (x,y+30,50,5);        //Mouth
    fill (220,0,0);
    rect (x,y+100,80,100);     //Body
    fill (220,0,0);
    rect (x-50,y+70,20,5);     //Left Arm
    fill (220,0,0);
    rect (x+50,y+70,20,5);     //Right Arm
    fill (220,0,0);
    ellipse (x+60,y+70,15,15);    //Right Fist
    fill (220,0,0);
    ellipse (x-60,y+70,15,15);    //Left Fist
    fill (220,0,0);
    rect (x-40,y+150,50,20);    //Left Foot
    fill (220,0,0);    
    rect (x+40,y+150,50,20);    //Right Foot
   
println(mouseX);
    
    //println("drawing");
}

//event function

