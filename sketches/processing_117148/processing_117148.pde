
PFont  font2, font3; 
String p1 = "In a little while from now"; 
String p2 = "If I'm not feeling any less sour"; 
String p3 = "I promise myself to treat myself"; 
String p4 = "And visit a nearby tower"; 
String p5 = "And climbing to the top"; 
String p6 = "Will throw myself off"; 
String p7 = "In an effort to make it clear"; 
String p8 = "To whoever what it's likeWhen you're shattered"; 
int page = 0;


void setup() {
  size(800, 800); 

  font2 = createFont("Arial", 100);
  font3 = createFont("Georgia", 80);
}

void draw() {
  textAlign(CENTER);

  if (page ==0) {
    background(#A0BBBC); 
    fill(255);
    textFont(font2, 20); 
    text(p1, width/2, height/2);
  }
  else if (page ==1) {
    background(#668F90); 
    fill(255);

    text(p2, width/2, 100);
  }  
  else if (page ==2) {
    background(#556464); 
    fill(255);
    textFont(font3, 20); 
    text(p3, width/2, 700);
  }
  else if (page ==3) {
    background(#C0D9E8); 
    fill(#6E8B9D);
    textFont(font2, 50); 
    text(p4, width/2, 700);
  }
  else if (page ==4) {
    background(#566771); 
    fill(255);
    textFont(font3, 50); 
    text(p4, width/2, 300);
  } 
    else if (page ==5) {
    background(#393B3B); 
    fill(255);
    textFont(font2, 50); 
    text(p4, width/2, 350);
    }  
    else if (page ==6) {
    background(#066671); 
    fill(255);
    textFont(font3, 50); 
    text(p4, width/2, 700);
    
    }   
    else if (page ==7) {
    background(#C0D8DB); 
    fill(#62949B);
    textFont(font2, 50); 
    text(p4, width/2, 600);
   
    }
else if (page ==8) {
    background(#3BA9B7); 
    fill(255);
    textFont(font3, 50); 
    text(p4, width/2, 100);
   
}
}


void mousePressed() {
  if ( page  == 0) {
    page  = 1;
  }
  else if ( page  == 1) {
    page  = int(random(2, 4));
  }
  else if ( page  == 2) {
    page  = int(random(3, 4));
  }
  else if ( page  == 3) {
    page  = int(random(5, 6));
  }
  else if ( page  == 4) {
    page  = int(random(7, 8));
  }
  else if ( page  == 5) {
    page  = int(random(1, 2));
  }
  else if ( page  == 6) {
    page  = int(random(3, 4));
  }
  else if ( page  == 7) {
    page =0;
  }
 
  //....
  println(page);
} 



