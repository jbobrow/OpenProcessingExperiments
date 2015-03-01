
PImage[] images = new PImage[20];
String[] name = new String[20];
int fruitName;
int caseNumber=0;
PImage back;
int choose=20;
int time;

void setup(){
  size(1200,700);
  frameRate(50);
  name[0] = "apple";
  name[1] = "apricot";
  name[2] = "banana";
  name[3] = "blueberry";
  name[4] = "cherry";
  name[5] = "coconut";
  name[6] = "grape";
  name[7] = "grapefruit";
  name[8] = "hazel";
  name[9] = "kiwifruit";
  name[10] = "lemon";
  name[11] = "orange";
  name[12] = "peach";
  name[13] = "pear";
  name[14] = "plumb";
  name[15] = "prunes";
  name[16] = "rangerine";
  name[17] = "raspberry";
  name[18] = "strawberry";
  name[19] = "yellowpeach";
  
  images[0] = loadImage("apple.jpg"); 
  images[1] = loadImage("apricot.jpg");
  images[2] = loadImage("banana.jpg");
  images[3] = loadImage("blueberry.jpg");
  images[4] = loadImage("cherry.jpg");
  images[5] = loadImage("coconut.jpg");
  images[6] = loadImage("grape.jpg");
  images[7] = loadImage("grapefruit.jpg");
  images[8] = loadImage("hazel.jpg");
  images[9] = loadImage("kiwifruit.jpg");
  images[10] = loadImage("lemon.jpg");
  images[11] = loadImage("orange.jpg");
  images[12] = loadImage("peach.jpg");
  images[13] = loadImage("pear.jpg");
  images[14] = loadImage("plumb.jpg");
  images[15] = loadImage("prunes.jpg");
  images[16] = loadImage("rangerine.jpg");
  images[17] = loadImage("raspberry.jpg");
  images[18] = loadImage("strawberry.jpg");
  images[19] = loadImage("yellowpeach.jpg");
  back = loadImage("back.jpg");
  fruitName=int(random(19));
  
}

void draw(){
  switch(caseNumber){
    case 0:
      case0();
    break;
    case 1:
      case1();
    break;
    case 2:
    case2();
    break;
    case 3:
    case3();
  }
  println(caseNumber);
}

void case0(){
  background(255);
  tint(255);
  for(int i=0;i<5;i++){
    image(images[i],230*i+37,24);
  }
  for(int i=5;i<10;i++){
    image(images[i],230*(i%5)+37,191);
  }
  for(int i=10;i<15;i++){
    image(images[i],230*(i%10)+37,358);
  }
  for(int i=15;i<20;i++){
    image(images[i],230*(i%15)+37,525);
  }  
}

void case1(){
  background(0);
  textSize(60);
  textAlign(CENTER);
  text(name[fruitName],width/2, height/2); 
  println(fruitName); 
  frameCount = 0;
}

void case2(){
  background(255);
  for(int i=0;i<5;i++){
      image(back,230*i+37,24);
  }
  for(int i=5;i<10;i++){
      image(back,230*(i%5)+37,191);
  }
  for(int i=10;i<15;i++){
      image(back,230*(i%10)+37,358);
  }
  for(int i=15;i<20;i++){
      image(back,230*(i%15)+37,525);
  }
  if(choose<5){
    image(images[choose],230*choose+37,24);
  }
  if(choose>4&&choose<10){
    image(images[choose],230*(choose%5)+37,191);
  }
  if(choose>9&&choose<15){
    image(images[choose],230*(choose%10)+37,358);
  }
  if(choose>14&&choose<20){
    image(images[choose],230*(choose%15)+37,525);
  }
  if(choose == fruitName){
    caseNumber =3;
    time = int(frameCount/40);
  }
}

void case3(){
  background(100);
  tint(100);
  for(int i=0;i<5;i++){
    image(images[i],230*i+37,24);
  }
  for(int i=5;i<10;i++){
    image(images[i],230*(i%5)+37,191);
  }
  for(int i=10;i<15;i++){
    image(images[i],230*(i%10)+37,358);
  }
  for(int i=15;i<20;i++){
    image(images[i],230*(i%15)+37,525);
  }  
  fruitName=int(random(19));
  choose = 20;
  textAlign(CENTER);
  text(time,width/2,height/2);
}

void mousePressed(){
  if(caseNumber==0){
    caseNumber=1;
  }
  if(caseNumber==2){
    if(mouseY>24 && mouseY<176){
      if(mouseX>37 &&mouseX<237){
        choose = 0;
      }
      if(mouseX>267 && mouseX<467){
        choose = 1;
      }
      if(mouseX>497 && mouseX<697){
        choose = 2;
      }
      if(mouseX>727 && mouseX<927){
        choose = 3;
      }
      if(mouseX>957 && mouseX<1157){
        choose = 4;
      }
    }
    if(mouseY>191 && mouseY<343){
      if(mouseX>37 &&mouseX<237){
        choose = 5;
      }
      if(mouseX>267 && mouseX<467){
        choose = 6;
      }
      if(mouseX>497 && mouseX<697){
        choose = 7;
      }
      if(mouseX>727 && mouseX<927){
        choose = 8;
      }
      if(mouseX>957 && mouseX<1157){
        choose = 9;
      }
    }
    if(mouseY>358 && mouseY<510){
      if(mouseX>37 &&mouseX<237){
        choose = 10;
      }
      if(mouseX>267 && mouseX<467){
        choose = 11;
      }
      if(mouseX>497 && mouseX<697){
        choose = 12;
      }
      if(mouseX>727 && mouseX<927){
        choose = 13;
      }
      if(mouseX>957 && mouseX<1157){
        choose = 14;
      }
    }
    if(mouseY>525 && mouseY<677){
      if(mouseX>37 &&mouseX<237){
        choose = 15;
      }
      if(mouseX>267 && mouseX<467){
        choose = 16;
      }
      if(mouseX>497 && mouseX<697){
        choose = 17;
      }
      if(mouseX>727 && mouseX<927){
        choose = 18;
      }
      if(mouseX>957 && mouseX<1157){
        choose = 19;
      }
    }
  }
}

void keyPressed(){
  if(caseNumber==1){
    caseNumber=2;
  }
  if(caseNumber==3){
    caseNumber =0;
  }
}


