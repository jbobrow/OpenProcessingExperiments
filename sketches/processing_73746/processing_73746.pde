
PImage body;
int x = 170;
int y = 105;
int i = 0;
int mouse =0;
int pharynx=0;
int esophagus = 0;
int stomach=0;
int s_intestine = 0;
int b_intestine = 0;
int timer = 0;
int starter = 0;
 
void setup()
{
  size(480,650);
}
 
void draw()
{
  i++;
  background(255,255,255);
  body = loadImage("body.png");
  image(body, 0, 0);
  fill(0);
  text("ระบบทางเดินอาหาร",150,620);
  starter++;
  if(starter > 30)
  {
    for(int m=0;m<2;m++)//speed
    {
            //ปาก
      if ( y == 105 && x < 230 )
      {
        mouse =1;
        ellipse(x, y, 15, 15);
        x++;
      }
      
      if(mouse == 1)
      {
          text("ปาก",120,110);
          ellipse(110,105,10,10);
          if (dist(110, 105, mouseX, mouseY) < 10)
          {
             text("(ทำหน้าที่ ย่อยอาหาร \nโดยการบดเคี้ยวของฟัน \nและเอนไซม์อะไมเลส\nหรือไทยาลีน)",20,120);
          } 
      } 
    
    
      if ( x == 230 && y < 300 )
      {
        pharynx =1;
        ellipse(x, y, 15, 15);
        y++;
      }
      
        if(y == 150)
        {
           esophagus =1;
        }
        
        if(pharynx == 1)
        {
            text("คอหอย",260,110);
            
            ellipse(250,105,10,10);
            if (dist(250, 105, mouseX, mouseY) < 10)
            {
               text("(ทำหน้าที่เป็นทางเดินอากาศ)",260,125);
            } 
        }
        
        if(esophagus == 1)
        {
            text("หลอดอาหาร",260,150);
            
            ellipse(250,145,10,10);
            if (dist(250, 145, mouseX, mouseY) < 10)
            {
               text("(มีการบีบตัว\nของกล้ามเนื้อทางเดินอาหาร\nเพื่อให้อาหารเคลื่อนที่\nลงสู่กระเพาะอาหาร)",260,170);
            } 
        }
      
      if ( y == 300 && x < 270 )
      {
        ellipse(x, y, 15, 15);
        x++;
      }
      
      //
      if ( x == 270 && y < 360 )
      {
        stomach=1;
        ellipse(x, y, 15, 15);
        y++;
      }
      
        if(stomach == 1)
        {
            text("กระเพราะอาหาร",310,320);
            
            ellipse(300,315,10,10);
            if (dist(300, 315, mouseX, mouseY) < 10)
            {
               text("(มีการย่อยทางเคมี\nโดยเอนไซม์เพปซิน(pepsin))",310,340);
            } 
        }
      
      if ( y == 360 && x > 167 )
      {
        ellipse(x, y, 15, 15);
        x--;
      }
      
      if ( x == 167 && y < 460)
      {
        ellipse(x, y, 15, 15);
        y++;
      }
      
      if ( y == 460 && x < 280 && x != 140 )
      {
        s_intestine =1;
        ellipse(x, y, 15, 15);
        x++;
      }
      
        if(s_intestine == 1)
        {
            text("ลำไส้เล็ก",90,420);
            
            ellipse(80,415,10,10);
            if (dist(80, 415, mouseX, mouseY) < 10)
            {
               text("(เป็นบริเวณที่มีการย่อย\nและการดูดซึมมากที่สุด)",20,435);
            } 
        }
      
        if ( x == 270 && y < 499 && y != 420)
        {
          ellipse(x, y, 15, 15);
          y++;
        }
    
        if ( y == 499 && x > 140 &&  x != 280)
        {
           ellipse(x, y, 15, 15);
           x--;
        }
      
        if ( x == 140 && y > 420)
        {
           b_intestine =1;
          ellipse(x, y, 15, 15);
          y--;
        }
      
        if(b_intestine == 1)
        {
            text("ลำไสใหญ่",310,410);
           
            ellipse(300,405,10,10);
            if (dist(300, 405, mouseX, mouseY) < 10)
            {
               text("(ไม่มีการย่อย\nแต่ทำหน้าที่เก็บกากอาหาร\nและดูดซึมน้ำ\nออกจากกากอาหาร)",310,425);
            } 
        }
      
        if ( y == 420 && x < 310 && x!= 167 && x!= 270)
        {
          ellipse(x, y, 15, 15);
          x=x+2;
        }
        
        if ( x == 270 && y < 540 )
        {
          ellipse(x, y, 15, 15);
          y=y+2;
        }
      
        if ( y == 540 && x > 200 )
        {
          ellipse(x, y, 15, 15);
          x--;
        }
      
        if(y == 540 && x == 200)
        {
          ellipse(x, y, 15, 15);
          text("ทวารหนัก",290,555);
          
          ellipse(280,550,10,10);
          if (dist(280, 550, mouseX, mouseY) < 10)
          {
             text("(ขับถ่ายกากอาหาร\nออกจาหร่างกาย)",290,570);
          }
            
          timer++;
        }
        
        if(timer == 150)
        {
          x = 170;
          y = 105;
          i = 0;
          mouse =0;
          pharynx=0;
          esophagus = 0;
          stomach=0;
          s_intestine = 0;
          b_intestine = 0; 
          timer=0;
          starter = 0;
        }
    }
   
  }
   
 
}//end void draw()


