
int x,y;

//setup
void setup(){
  size(1000,1000);
}
//draw
void draw(){
  if (mousePressed == true) {
    fill(234,141,141);
    } else {
    fill(99,0,0);
  }  rect(0,0, 1000, 1000);
 
  x = mouseX;
  y = mouseY;

//outer circle 
    //click
            if (mousePressed == true) {
                fill(23,42,255);
              } else {
                fill(80,255,0);
              }  ellipse(500,500,800,800);
  //fill(255,194,17);
  //fill(127,58,122);
  ellipse(500,500,800,800);
  
//squares
    //left
      fill(2,58,132);
      rect(200,400,200,200);
    // top
      fill(64,115,77);
      rect(400,200,200,200);
    // bottom
      fill(217,121,37);
      rect(400,600,200,200);
    // right
      fill(172,68,242);
      rect(600,400,200,200);

//triangles
    //top
        //Click
           if (mousePressed == true) {
                fill(255,255,0);
              } else {
                fill(227,224,126);
              }
      triangle(500,100,600,200,400,200);
      
      //mouseover
            if (x < 540 && x > 445 && y < 400 && y > 300){
               fill(255,15,104);
               triangle(500,100,600,200,400,200);}
            
    // right
        //click
            if (mousePressed == true) {
                fill(255,0,124);
              } else {
                fill(137,21,204);
              } triangle(800,400,900,500,800,600);
       //mouseover
             if (x < 700 && x > 600 && y < 550 && y > 450){
               fill(228,115,255);
               triangle(800,400,900,500,800,600);}
            
    // bottom
        //click
            if (mousePressed == true) {
                fill(0,155,255);
              } else {
                fill(255,204,102);
              } triangle(600,800,500,900,400,800);
       //mouseover
             if (x < 550 && x > 450 && y < 700 && y > 600){
               fill(255,179,7);
               triangle(600,800,500,900,400,800);}
            
    // left
        //click
            if (mousePressed == true) {
                fill(179,255,0);
              } else {
                fill(0,102,204);
              }  triangle(200,400,200,600,100,500);
       //mouseover
             if (x < 400 && x > 300 && y < 550 && y > 450){
               fill(255);
                triangle(200,400,200,600,100,500);}
      
//Quads 
    //top left
        //click
            if (mousePressed == true) {
                fill(127,58,122);
              } else {
                fill(191,87,183);
              } quad(380, 120, 380, 300, 300, 380, 120, 380);
       //mouseover
             if (x < 600 && x > 400 && y < 600 && y > 400){
               fill(255,115,244);
               quad(380, 120, 380, 300, 300, 380, 120, 380);}
      
    //top right
        //click
            if (mousePressed == true) {
                fill(127,58,122);
              } else {
                fill(191,87,183);
              } quad(620, 120, 880, 380, 700, 380, 620, 300);
       //mouseover
             if (x < 600 && x > 400 && y < 600 && y > 400){
               fill(255,115,244);
               quad(620, 120, 880, 380, 700, 380, 620, 300);}
     
    //bottom right
        //click
            if (mousePressed == true) {
                fill(127,58,122);
              } else {
                fill(191,87,183);
              } quad(700,620,880,620,620,880,620,700);
       //mouseover
             if (x < 600 && x > 400 && y < 600 && y > 400){
               fill(255,115,244);
                quad(700,620,880,620,620,880,620,700);}
    
    //bottom left
        //click
            if (mousePressed == true) {
                fill(127,58,122);
              } else {
                fill(191,87,183);
              } quad(120,620,300,620,380,700,380,880);
       //mouseover
             if (x < 600 && x > 400 && y < 600 && y > 400){
               fill(255,115,244);
               quad(120,620,300,620,380,700,380,880);}
      
//middle circle
  if (mousePressed == true) {
                fill(0,253,255);
              } else {
                fill(154,9,13);
              } ellipse(500,500,400,400);
  
  
//inner circle
      fill(102,7,94);
      ellipse(500,500,200,200);
  //Mouseover
       if (x < 600 && x > 400 && y < 600 && y > 400){
          fill(251,1,255);
          ellipse(500,500,200,200);}
 
//circles on red circle
    //top 
     //Click
           if (mousePressed == true) {
                fill(255,255,0);
              } else {
                fill(6,204,0);
              }
      ellipse(500,350,100,100);
      
      //mouseover
            if (x < 540 && x > 445 && y < 400 && y > 300){
               fill(255,15,104);
               ellipse(500,350,100,100);}
    //left 
      //click
            if (mousePressed == true) {
                fill(179,255,0);
              } else {
                fill(108,115,255);
              } ellipse(350,500,100,100);
       //mouseover
             if (x < 400 && x > 300 && y < 550 && y > 450){
               fill(255);
               ellipse(350,500,100,100);}
    
    //right 
      //click
            if (mousePressed == true) {
                fill(255,0,124);
              } else {
                fill(162,107,255);
              } ellipse(650,500,100,100);
       //mouseover
             if (x < 700 && x > 600 && y < 550 && y > 450){
               fill(228,115,255);
               ellipse(650,500,100,100);}
          
    //bottom 
      //click
            if (mousePressed == true) {
                fill(0,155,255);
              } else {
                fill(229,157,9);
              } ellipse(500,650,100,100);
       //mouseover
             if (x < 550 && x > 450 && y < 700 && y > 600){
               fill(255,179,7);
               ellipse(500,650,100,100);}
     


       


}



