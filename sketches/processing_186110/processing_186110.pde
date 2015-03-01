
//yung kandinshi yaya
//copying dat kandinsky.jpg

//int orangeWidth
//int orangeHeight
//int orangeX
//int orangeY

void setup() {
  size(800, 800);
  background(240, 225, 180);
}

void draw() {
  noStroke();

  //beige spotlight
  //*Make browner*
  fill(255, 225, 110, 120);
  quad(780, 0, 740, 0, 0, 600, 0, 860);


  //blue spotlight
  fill(222, 240, 245, 100);
  quad(55, 0, 205, 0, 800, 520, 800, 770);
  //x1, y1, x2, y2, x3, y3, x4, y4

//Circles

  //outer black circle
  stroke(32);
  strokeWeight(30);
  fill(0, 0, 0, 0);
  ellipse(width/2, height/2, width/1.3, height/1.3);

  //yellow big under circle
  strokeWeight(1);
  fill(250, 200, 70, 135);
  ellipse(310, 460, 180, 180);
  
  //big pink top left
  strokeWeight(3);
  fill(255,150,145,165);
  ellipse(287,275,140,140);
  
  //bloodred upper big circle
  strokeWeight(2);
  fill(210,85,75,175);
  ellipse(400,302,120,120);
  
  //big yellow far right
  strokeWeight(1);
  fill(245,230,45,100);
  ellipse(520,380,160,160);
  
  //Black circle top right
  strokeWeight(0);
  fill(0);
  ellipse(450,263,60,60);
  
  //light blue greenish to left of big one
  strokeWeight(2);
  fill(200,215,210,120);
  ellipse(300,345,100,100);
  
  //little dark red circle in center
  strokeWeight(3);
  fill(#5F0606,190);
  ellipse(417,486,26,26);
  
  //blood red circle bottom left
  strokeWeight(5);
  fill(#B42323,180);
  ellipse(300,545,60,60);

  //greyblueinner circle
  strokeWeight(1);
  fill(#8188A0, 120);
  ellipse(390, 445, 250, 250);

  //yellow circle bottom right
  strokeWeight(5);
  fill(#F0CB46, 120);
  ellipse(510, 520, 120, 120);
  
  //orange circle
  stroke(1);
  strokeWeight(7);
  fill(255,115,10,170);
  ellipse(380,377,70,70);
    //black circle within orange circle
    fill(0);
    ellipse(380,377,20,20);
    
    
//Lines

  //top horizontal, thru black circle
  strokeWeight(2);
  line(195,263,615,263);
  
  //thick top right to bottom left
  strokeWeight(4);
  line(320,640,485,160);
  
  

}



