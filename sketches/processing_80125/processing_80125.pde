
int a=255;
int b=255;
int c=0;
int d=0;
int e=0;
int f=0;
int g=80;
int h=0;
int j=126;


void setup (){
  size (800,600);
   background (g,h,j);
   smooth();
}

void draw (){
  
  fill (g,h,j,10);
  rect (-1,-1,width+1,height+1);
  

amarillo();
negro();


  
}

void negro (){
  
  noFill();
  
  
  for ( int i= 0; i<width ; i+=10){
  
  strokeWeight (random(1,3));
  stroke (d,e,f,random (0,30));
  beginShape ();
  curveVertex ( width - pmouseX,height - pmouseY);
  curveVertex (width - mouseX,height - mouseY);
  curveVertex (i,height/2);
  curveVertex (width - mouseX,height - mouseY);
  curveVertex(width - pmouseX,height - pmouseY);
  endShape();
 }


 for ( int i= 0; i<height ; i+=10){
  
  strokeWeight (random(1,3));
  stroke (d,e,f,random (0,30));
  beginShape ();
  curveVertex (width - pmouseX,height - pmouseY);
  curveVertex (width -mouseX,height - mouseY);
  curveVertex (width/2,i);
  curveVertex (width -mouseX,height - mouseY);
  curveVertex(width -pmouseX,height - pmouseY);
  endShape();
 }
  
}

void amarillo (){
  
  noFill();
  
   for ( int i= 0; i<width ; i+=random(1,10)){
  
  strokeWeight (random(1,3));
  stroke (a,b,c,random (0,80));
  beginShape ();
  curveVertex ( pmouseX,pmouseY);
  curveVertex (mouseX,mouseY);
  curveVertex (i,height/2);
  curveVertex (mouseX,mouseY);
  curveVertex(pmouseX,pmouseY);
  endShape();
 }


 for ( int i= 0; i<height ; i+=random(1,10)){
  
  strokeWeight (random(1,5));
  stroke (a,b,c,random (0,80));
  beginShape ();
  curveVertex ( pmouseX,pmouseY);
  curveVertex (mouseX,mouseY);
  curveVertex (width/2,i);
  curveVertex (mouseX,mouseY);
  curveVertex(pmouseX,pmouseY);
  endShape();
 }
  
  
}

void keyPressed (){
  
  if (key == ' '){
    saveFrame ();
  }
  
  if (key == 'a' ){
    a=0;
  }
    
    if (key == 'A'){
      a=255;
    }

    if (key =='b'){
      b=0;
    }
    if (key == 'B'){
       b=255;
    }
    
    if (key == 'c'){
      c=255;
    }

    if (key == 'C'){
      c=0;
    }
    
    if (key =='d'){
      d=255;
    }

    if (key == 'D'){
      d=0;
    }
    
    if (key == 'e'){
      e=255;
    }
    
    if (key =='E'){
       e=0;
    }
    
    if (key == 'f'){
      f=255;
    }
    
    if (key =='F'){
       f=0;
    }
    
    if (key == 'g'){
      g=255;
    }
    
    if (key == 'G'){
       g=80;
    }
    if (key =='j'){
      j=0;
    }
    if (key == 'J'){
       j=126;
    }

}

