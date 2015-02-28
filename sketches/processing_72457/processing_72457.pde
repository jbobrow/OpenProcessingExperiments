
void setup(){
  size (600,600) ;

PImage b;
b = loadImage("pink.jpg");
background(b);

}

void draw(){
  for (int i = 0; i<height ; i+=20){
  rect(i,i,100,100);
  smooth();

    fill(142, 16, 44,2);


  }
  for (int i = 0 ; i<height ; i+=30){
  rect(i+200,i-100,100,100);
  smooth();

  
 fill(247, 105, 28,2);
tint(255,255,255,120);

   }
  for (int i = 0 ; i<height ; i+=20){
      triangle(i+0, i+0, i+58, i+20, i+86, i+75);
      smooth();

  fill(6, 2, 39,2);
   }
  for (int i = 0 ; i<height ; i+=20){
    smooth();

  rect(i-300,i+0,100,100);
  smooth();

    }
    fill(247, 105, 28,2);
   

  for (int i = 0 ; i<height ; i+=20){
    smooth();

      triangle(i+0, i+0, i-58, i-20, i-86, i-75);
      smooth();

      
  }

    fill(6, 2, 39,2);



}
   
  


 
  




