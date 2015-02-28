

int i = 0;
int j = 0;
int counti = 0;
int countj = 0;
int tmpX = 0;
int tmpY = 0;

int moveX = width/2;
int moveY = height/2;

int valueX = 0;
int valueY = 0;

int Anum = 0;
String Ename;
String Csymbol;
float Aweight = 0.0; 
float AwGraph = 0.0; 

 
void setup ()
{
  size(800,800);
  frameRate(10);
  colorMode(RGB, 100);

}


void draw()
{

  background(0,0,0,20);
  noFill();
  strokeWeight(1);
  textSize(10); 

        int wdth = width;
        int hght = height;

        textSize(40); 
        
// on the bottom right - back
        fill(100,50,50,50);
        rect(0,0,400,400);
        fill(100,100,100,100);
        text( "QTY", width/10, height/10);
        
      
 // on the top right - back
        fill(100,100,50,50);
        rect(400,0,800,400);
        fill(100,100,100,100);
        text( "AMT", width/2+50, height/10);
   

// on the bottom left - back
        fill(50,100,100,50);
        rect(0,400,400,800);        
        fill(100,100,100,100);
        text( "ASP", width/10, height/2+50);

      
// on the top left - back
        fill(50,50,100,50);
        rect(400,400,800,800);
        fill(100,100,100,100);
        text( "RAT", width/2+50, height/2+50);

       
        fill(100,100,100,100);
        stroke(1);
        beginShape();
        vertex(width/9, height/4);
        vertex(width/6, height/2.5);
        vertex(width/5, height/6);
        vertex(width/4, height/2.8);
        vertex(width/3, height/8);
        vertex(width/2.5, height/4);
        endShape();

        fill(100,100,100,100);
        rect( wdth/1.6, hght/6, 200, 200);

        fill(100,100,100,90);
        triangle(wdth/4, hght/1.6, wdth/10, hght/1.15, wdth/2.5, hght/1.15);
        
        fill(100,100,100,100);
        ellipse(wdth/1.35, hght/1.35, 200, 200);
        
        
}


void mousePressed()
{

  background(0,0,0,20);
  noFill();
  strokeWeight(1);
  textSize(10); 
  
  if( mouseButton == LEFT ) {
  
    moveX = mouseX;
    moveY = mouseY;
    textSize(50); 

    fill(0,0,0,100);
    rect(25,25,750,750);
  
    if (moveX > width/2 && moveY > height/2 ) {  // on the bottom right

        fill(50,50,100,90);
        text( "RAT", width/2+50, height/2+50);
        
        textSize(25); 
        text( "distribution ratio", 50, 50);
        
        fill(100,100,100,100);
        ellipse(width/3, height/3, 400, 400);
        fill(10,100,100,30);

        
        fill(0,0,0,90);
        textSize(18); 
        text( "Pr", width/3+50, height/3-150);
        text( "Ad", width/3+100, height/3-100);
        text( "Pf", width/3+150, height/3);
        text( "Es", width/3-50, height/3+150);
        text( "Pd", width/3-170, height/3+80);
        text( "Sp", width/3-170, height/3-50);
        text( "Wl", width/3-80, height/3-150);

        
      }
      
    if (moveX > width/2 && moveY < height/2 ) {  // on the top right
        
        fill(100,100,50,90);
        text( "AMT", width/2+50, height/10);    
        
        fill(100,100,10,50);
        rect(100,400,50,height-500);
        fill(100,100,20,50);
        rect(150,300,50,height-400);
        fill(100,100,30,50);
        rect(200,500,50,height-600);
        fill(100,100,40,50);
        rect(250,200,50,height-300);
        fill(100,100,50,50);
        rect(300,400,50,height-500);
        fill(100,100,60,50);
        rect(350,500,50,height-600);
        fill(100,100,70,50);
        rect(400,200,50,height-300);
        fill(100,100,80,50);
        rect(450,400,50,height-500);
        fill(100,100,90,50);
        rect(500,500,50,height-600);
        fill(100,100,100,50);
        rect(550,300,50,height-400);  
        
      }      

    if (moveX < width/2 && moveY > height/2 ) {  // on the bottom left
        
        fill(50,100,100,90);
        text( "ASP", width/10, height/2+50);

        beginShape();
        vertex(400, 100);
        vertex(500, 200);
        vertex(600, 300);
        vertex(700, 400);
        vertex(600, 500);
        vertex(500, 600);
        vertex(400, 700);
        vertex(300, 600);
        vertex(200, 400);
        vertex(100, 200);
        endShape(CLOSE);

      }
      
    if (moveX < width/2 && moveY < height/2 ) {  // on the top left
        
        fill(100,50,50,90);
        text( "QTY", width/10, height/10);

        noFill();
        stroke(100,100,100,80);
        strokeWeight(10);
        line(100, 400, 200, 200);
        line(200, 200, 300, 600);
        line(300, 600, 400, 100);
        line(400, 100, 500, 700);
        line(500, 700, 600, 300);
        line(600, 300, 700, 400);

        stroke(100,50,50,80);
        strokeWeight(8);
        line(100, 400, 200, 500);
        line(200, 500, 300, 700);
        line(300, 700, 400, 300);
        line(400, 300, 500, 400);
        line(500, 400, 600, 800);
        line(600, 800, 700, 400);

      }    
      
        noFill();

  }

  
  noLoop();  // マウスボタンを押している間、draw()を呼び出さないようにする
}
  
// マウスボタンを離すと、draw()の定期呼び出しを再開する
void mouseReleased()
{
  loop();
}



