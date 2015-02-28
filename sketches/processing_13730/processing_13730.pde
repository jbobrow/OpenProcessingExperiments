
// happy coding ~
size(200,200);






void setup(){
  size(200,200);
  colorMode(HSB);
}

void draw(){
   for(int x=0;x<250;x=x+8){
fill(random(255),255,255);
rect(x,0,5,200);
noLoop();
 }
 
}


                
                
