
PFont font1, font2, font3, font4, font5;
PImage img1, img2, img3, img4, img5, img6, img7, img0;

String s0 = "HOW DOTH THE LITTLE CROCODILE";
String s1 = "IMPROVE HIS SHINING TAIL";
String s2 = "AND POUR THE WATERS OF THE NILE";
String s3 = "ON EVERY GOLDEN SCALE!";
String s4 = "HOW CHEERFULLY HE SEEMS TO GRIN,";
String s5 = "HOW NEATLY SPREADS HIS CLAWS,";
String s6 = "AND WELCOMES LITTLE FISHES IN";
String s7 = "WITH GENTLY SMILING JAWS!";
//Poem by Lewis Carroll, <Alice's Adventures in Wonderland>

int page = 0;

void setup(){
  
  size(500,700);
  font1 = loadFont("ChaletComprime-CologneEighty-60.vlw");
  font2 = loadFont("ChaletComprime-CologneEighty-20.vlw");
  font3 = loadFont("NeutraTextTF-Light-30.vlw");
  font4 = loadFont("AmplitudeExtraComp-Ultra-30.vlw");
  font5 = loadFont("Chalkduster-30.vlw");
    
  img0 = loadImage("0.jpg");
  img1 = loadImage("1.jpg");
  img2 = loadImage("2.jpg");
  img3 = loadImage("3.jpg");
  img4 = loadImage("4.jpg");
  img5 = loadImage("5.jpg");
  img6 = loadImage("6.jpg");
  img7 = loadImage("7.jpg");  

  
}


void draw(){
  
  textAlign(CENTER);
  smooth();
  
  if(page == 0){
  
    frameRate(75);
    
    fill(85, 200, random(255));
    image(img2,0,0);
    img2.filter(INVERT);

    textFont(font2, 20);
    text(s0, 120, 100);
  }
  
  else if(page ==1){
    
    frameRate(50);
    
    fill(255);
    image(img0, 0, 0, 500, 700);
    img0.filter(INVERT);

    textFont(font1, 60);
    text(s1, width/2, 700*cos(mouseY/2));
  }

  else if(page ==2){
    
    frameRate(6);
    
    fill(100);
    image(img1, 0, 0, 500, 700);
    img1.filter(DILATE);

    textFont(font1, 30);
    text(s2, width/2, height/2);
  }

  else if(page ==3){
    
    frameRate(2);
    
    fill(random(255));
    image(img3, 0, 0, 500, 700);
    img3.filter(INVERT);

    textFont(font3, 20);
    text(s3, 350, 650);
  }
  
    else if(page ==4){
    
    frameRate(5);
    
    fill(random(125,255));
    image(img4, 0, 0, 500, 700);
    tint(255, 90, random(120));
    textFont(font4, 30);
    text(s4, width/2, height/2);
  }

  
    else if(page ==5){
    
    frameRate(3);
    
    fill(255);
    image(img5, 0, 0, 600, 700);
    img5.filter(INVERT);
    tint(0, 255, random(255));
    textFont(font1, 40);
    text(s5, width/2, mouseY);
  }

    else if(page ==6){
    
    frameRate(2);
    
    fill(random(120));
    image(img6, 0, 0, 500, 700);
    tint(random(120,255));
    textFont(font2, 20);
    text(s6, 120, random(110,255));
  }


    else if(page ==7){
    
    frameRate(5);
    
    fill(255);
    image(img7, 0, 0, 500, 700);
    tint(random(165,255), random(255),130);
    textFont(font5, 25);
    text(s7, random(200,300), height/2);
  }

}





void mousePressed(){
  if(page == 0){
  page = int(random(0, 7));
  }
  
  else if(page == 1){
  page = int(random(0, 7));
  }
  
  else if(page == 2){
  page = int(random(0, 7));
  }
  
  else if(page == 3){
  page = int(random(0, 7));
  }
  
  else if(page == 4){
  page = int(random(0, 7));
  }
  
  else if(page == 5){
  page = int(random(0, 7));
  }
  
  else if(page == 6){
  page = int(random(0, 7));
  }
  
  
  println(page);
}




