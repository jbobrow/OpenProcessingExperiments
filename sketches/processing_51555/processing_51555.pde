
void setup(){
  size(600,600);
  smooth();
  strokeWeight(.125);
  noFill();
  //background(110);
}

void draw(){
  fill(150,9);
  rect(0,0,width, height);
  stroke(240);
   // for (int k=0; k < width+40; k+=80){
     // for(int l=0; l < height+40; l+=80){
       // ellipse(k,l,minute()*2,minute()*2);
           for(int i=0; i < width+15; i += 30){
              for(int j=0; j < height+15; j += 30){
                ellipse (i,j,second()*2,second()*2);
              }
            }
     //}
  //}
}


void mousePressed(){
 stroke(0);
 strokeWeight(.55);
 for (int k=0; k < width+30; k+=60){
    for(int l=0; l < height+30; l+=60){
       ellipse(k,l,minute()*2,minute()*2);
    }
 }
}

//fix this, hours are not displaying on release
void mouseReleased(){
 stroke(0);
 strokeWeight(.55);
 for (int m=0; m < width+45; m +=90){
    for(int n=0; n < height+45; n +=90){
       ellipse(m,n,hour()*2,hour()*2);
    }
 }
}


  
         
   




    

