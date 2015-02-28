



void setup(){

  size(1000,1000);

}




void draw(){

  for(int x = 0;x < width; x+=10){

    for(int y = 0; y < height; y+=100){

      if(mouseX > x && mouseX < x +10 && mouseY > y && mouseY < y+10){

        fill(255,0,0);

      } else {

        fill(88,5);

      }

      strokeWeight(.1);

      rect(mouseX,y,65,65);

      float speedX = abs(mouseX-pmouseX);

      if(x%10 == 0){

        ellipse(x,y,mouseX/10,mouseY/10);

      }

    }

  }

}




void mouseReleased(){

     background(mouseX,mouseY);
}
     void mousePressed(){
       background(91,255,10);

}

