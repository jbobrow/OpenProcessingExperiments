
PImage me;
PFont main;
PFont sub;

void setup(){
  size(600,398);
  
  me = loadImage("headshot.png");
  main =loadFont("me.vlw");
  sub=loadFont("activities.vlw");
}

void draw() {
     background(255);
     image(me,0,0);
     fill(0);
     textFont(main, 20);
     text("Hi, my name is Katherine:", 180, 30);
     textFont(sub,16);
     if(mouseX > 20 && mouseX < 150 && mouseY > 300 && mouseY < 400){
     fill(102, 178, 255);
     text("MA+P", 60,350);
     }
     if(mouseX > 380 && mouseX < 580 && mouseY > 270 && mouseY < 400){
     fill(255, 153, 51);
     text("Diving", 480, 320);
     }
     if(mouseX > 0 && mouseX < 160 && mouseY > 200 && mouseY < 300){
     fill(0,153,153);
     text("Country Music", 60, 260);
     }
     if(mouseX > 310 && mouseX < 510 && mouseY > 180 && mouseY < 280){
     fill(0, 153, 0);
     text("Vienna, VA", 410, 230);
     }
     if(mouseX > 28 && mouseX < 228 && mouseY > 130 && mouseY < 230){
     fill(255, 51, 51);
     text("Fight On", 128, 180);
     }
     if(mouseX > 290 && mouseX < 490 && mouseY > 90 && mouseY < 190){
      fill(102, 0, 51, 204);
     text("Documentaries", 390, 140);
     }
     if(mouseX > 0 && mouseX < 200 && mouseY > 30 && mouseY < 130){
     fill(255, 51,153);
     text("Beach Volleyball", 90, 80);
     }
     if(mouseX > 270 && mouseX < 470 && mouseY > 30 && mouseY < 130){
      fill(0,102,102);
     text("Finding Nemo", 370, 80);
     }
    
     
    
     
  
}


