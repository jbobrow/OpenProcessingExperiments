
void setup(){
 size(300,200);
 background(0);
 smooth();
}

void draw(){
frameRate(100); 

filter(BLUR,1);


if(mousePressed){

  fill(0,30);
 noStroke();
 rect(0,0,width,height);

 
  
  noFill();
  for(int i=0; i<width; i+=30){
   for(int j=0;j<height;j+=30){
 
 noFill();

   stroke(mouseY,mouseX,random(255),random(50,120));


line(pmouseX,pmouseY,i,j);

//bezier(mouseX,mouseY,random(500),random(500),mouseX,mouseY,i,j) ;
 }


} 

}
}

                
                
