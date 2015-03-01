
int pen;
int pentype;
int penR;
int penG;
int penB;


void setup(){
    size(500,500);
    background(255,255,255);
    frameRate(600);
    pen = 5;
    pentype =1;
    penR = penG = penB = 0;
    makeTools();
}

void mouseDragged(){  
//    fill(0,0,0);
//    noStroke();
//    smooth();
    if(mouseX > 50){
      pen(); 
    }
}
void mousePressed(){
  if(mouseX <= 50 && mouseY <= 25){
      fill(255,255,255); 
      rect(50,0,500,500);
    }
  if(mouseX <= 50 && mouseY <= 50 && mouseY >= 25 ){
      pentype =1;
    }
  if(mouseX <= 50 && mouseY <= 75 && mouseY >= 50 ){
      pentype =2;
    }
  if(mouseX <= 50 && mouseY <= 100 && mouseY >= 75 ){
      pentype =3;
    }  
  if(mouseX <= 50 && mouseY <= 125 && mouseY >= 100 ){
      pentype =4;
    } 
  if(mouseX <= 50 && mouseY <= 150 && mouseY >= 125 ){
     penR +=1;
     println( "penR"+penR );
     if(penR >= 255){penR = 255;}
    } 
  if(mouseX <= 50 && mouseY <= 175 && mouseY >= 150 ){
     penR -=1;
     println( "penR"+penR );
     if(penR <= 0){penR = 0;}
    }
  if(mouseX <= 50 && mouseY <= 200 && mouseY >= 175 ){
     penG +=1;
     println( "penG"+penG );  
     if(penG >= 255){pen = 255;}
    }
  if(mouseX <= 50 && mouseY <= 225 && mouseY >= 200 ){
     penG -=1;
     println( "penG"+penG );  
     if(penG <= 0){penG = 0;}
    }
  if(mouseX <= 50 && mouseY <= 250 && mouseY >= 225 ){
     penB +=1;
     println( "penB"+penB );
     if(penB >= 255){pen = 255;}   
    }
  if(mouseX <= 50 && mouseY <= 275 && mouseY >= 250 ){
     penB -=1;
     println( "penB"+penB ); 
     if(penB <= 0){penB = 0;}
    }
  if(mouseX <= 50 && mouseY <= 300 && mouseY >= 275 ){
     println( "penR"+penR );
     println( "penG"+penG );
     println( "penB"+penB );
     println( "pen"+pen );
     println( "pentype"+pentype );
    }
  
}


void draw() {
 strokeWeight(1);
 fill(penR,penG,penB);
 rect(0,450,50,50);
 

}


void keyPressed(){ //debug & hotkey
     switch(key) {
     case '1':
     fill(255,255,255); 
     rect(50,0,500,500);   
     break;
     case '2':
     pen +=1;
     println( "pen"+pen );
     break;
     case '3':
     pen -=1; 
     println( "pen"+pen );  
     if(pen <= 1){pen = 1;}  
     break;
     case '4':
     pentype =1;   
     break;
     case '5':
     pentype =2;  
     break;
     case '6':
     pentype =3;   
     break;
     case '7':
     pentype =4; 
     break;
     case '8':
     pentype =5; 
     break;
     case '9':
     pentype =6; 
     break;
     case '0':
     pentype =7; 
     break;
     case 'a':
     penR +=1;
     println( "penR"+penR );
     if(penR >= 255){penR = 255;} 
     break;
     case 's':
     penR -=1;
     println( "penR"+penR );
     if(penR <= 0){penR = 0;}  
     break;
     case 'd':
     penG +=1;
     println( "penG"+penG );  
     if(penG >= 255){pen = 255;}
     break;
     case 'f':
     penG -=1;
     println( "penG"+penG );  
     if(penG <= 0){penG = 0;}
     break;
     case 'g':
     penB +=1;
     println( "penB"+penB );
     if(penB >= 255){pen = 255;}  
     break;
     case 'h':
     penB -=1;
     println( "penB"+penB ); 
     if(penB <= 0){penB = 0;} 
     break;
     case 'j':
     println( "penR"+penR );
     println( "penG"+penG );
     println( "penB"+penB );
     println( "pen"+pen );
     println( "pentype"+pentype );
     break;
     case 'q': 
     penR =255;
     penG =0;
     penB =0;
     break;
     case 'w': 
     penR =255;
     penG =128;
     penB =0;
     break;
     case 'e':
     penR =255;
     penG =255;
     penB =0; 
     break;
     case 'r':
     penR =0;
     penG =255;
     penB =0; 
     break;
     case 't': 
     penR =0;
     penG =0;
     penB =255;
     break;
     case 'y': 
     penR =0;
     penG =0;
     penB =204;
     break;
     case 'u': 
     penR =102;
     penG =0;
     penB =204;
     break;
     }
}
void mouseReleased(){
  makeTools();
}


void makeTools(){
    fill(255);
    strokeWeight(1);
    stroke(0);
    
    

    rect(0,0,50,25);
    rect(0,25,50,25);
    rect(0,50,50,25);
    rect(0,75,50,25);
    rect(0,100,50,25);
    rect(0,125,50,25);
    rect(0,150,50,25);
    rect(0,175,50,25);
    rect(0,200,50,25);
    rect(0,225,50,25);
    rect(0,250,50,25);
    rect(0,275,50,25);
    rect(0,300,50,150);
    
    fill(0,0,0);
    text("reset",10,15);
    text("line",10,40);
    text("ellipse",10,65);
    text("rect",10,90);
    text("awa",10,115);
    text("R+",10,140);
    text("R-",10,165);
    text("G+",10,190);
    text("G-",10,215);
    text("B+",10,240);
    text("B-",10,265);
    text("status",10,290);
}
void pen(){
  
  if( pentype == 1 ){
    
    stroke(penR,penG,penB);
    strokeWeight(pen);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if( pentype == 2 ){
    fill(penR,penG,penB);
    noStroke();
    ellipse(mouseX, mouseY,pen,pen);
  }
  if( pentype == 3 ){
  noFill();
  smooth();
  stroke(penR,penG,penB);
  rectMode(CENTER);
  rect(mouseX, mouseY, random(5,30), random(5,30));
  rectMode(CORNER);
  }
  if( pentype == 4 ){
  noFill();
  smooth();
  stroke(penR,penG,penB);
  ellipse(mouseX+random(-20,20),mouseY+random(-20,20),20,20);
  }
  if( pentype == 5 ){
    
    stroke(random(128)+random(128),0,0);
    strokeWeight(pen);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if( pentype == 6 ){
    
    stroke(0,random(128)+random(128),0);
    strokeWeight(pen);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
  if( pentype == 7 ){
    
    stroke(0,0,random(128)+random(128));
    strokeWeight(pen);
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}




