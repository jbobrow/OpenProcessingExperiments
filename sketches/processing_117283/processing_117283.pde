

void mousePressed(){
  if (page ==0){
    page =int(random(0,3));
  }
  else if (page ==1){
    page =int(random(0,3));
  }
  else if (page ==2){
    page =int(random(0,3));
  }
  else if (page ==3){
    page =int(random(0,3));
  }
  else if (page ==4){
    page =int(random(0,3));
  }

}



PFont font1, font2, font3;
PImage img1, img2;

int page =0;

void setup(){
  
  size(480,800);
  
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  
  font1 = loadFont("Calibri-48.vlw");
  font2 = loadFont("Calibri-Bold-70.vlw");
  font3 = loadFont("Calibri-25.vlw");
  
  
  

}


void draw(){
  
  
  
  textAlign(CENTER);
  background(0);
  
  if(page ==0){
  
  fill(255);
  textFont(font3,25);
  text("When he shall die,", width/2,200);
  
  textFont(font3,20);
  text("Press 's' key", width/2,700);
  }
  else if(page ==1){
     fill(255);
     image(img1,0,0);
  textFont(font3,25);
  text("Take him and cut him out in little stars,", width/2,200);
  textFont(font3,20);
  text("Press 's' key", width/2,700);
  }
  else if(page ==2){
     fill(255);
  textFont(font3,25);
  text("And he will make the face of heaven so fine", width/2,200);
  textFont(font3,20);
  text("Press 's' key", width/2,700);
  }
  else if(page ==3){
     fill(255);
  textFont(font3,25);
  text("That all the world will be in love with night", width/2,200);
  textFont(font3,20);
  text("Press 's' key", width/2,700);
  }
  else if(page ==4){
     fill(255);
     image(img2,0,0);
  textFont(font3,25);
  text("And pay no worship to the garish sun.", width/2,200);
  textFont(font3,20);
  text("Press 's' key", width/2,700);
  }
  
  
  
  
  
/*  if(mousePressed){
  fill(255);
  textFont(font2,70);
  text("banana", width/2,300);
  }bbb

    */
    
/*  if(keyPressed){
    if(key =='b'|| key =='B'){
        fill(255);
  textFont(font2,70);
  text("banana", width/2,300);
    }
    else if (key == 'a' || key =='A'){
      fill(0);
      textFont(font2,70);
  text("banana", width/2,300);
    }
  }
  
  */
  
 
  
 
  
  
  
}


