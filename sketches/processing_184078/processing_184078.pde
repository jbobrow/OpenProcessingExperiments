
void setup()
{
  size(800,500);
  background(163,197,255);
  smooth();
   String s = "You may press w a s d f g or the arrow keys to receieve a phrase. Make what you will of the sequence."; 
   textSize(30);
   textAlign (CENTER); 
   fill (0);
   text (s,200,200,400,400); 
   print(s);     
}



void draw()
{

    if (key == 'g')
    {
       background(47,161,50);
        String g = "some day"; 
        textSize(40);
        textAlign (CENTER); 
        fill (0);
        text (g,200,200,400,400);
        print(g);
        
    }
        
        
     if (key == 'w')
     {
          background(250,250,102);
          textSize(40);
          textAlign (CENTER); 
          String w = "the sun";
          fill (0);
          text (w,200,200,400,400); 
          print(w);
         
     }  

    if (key == 's')
    {
        background(13,1,3);
        textSize(40);
        textAlign (CENTER); 
        String s = "will die";
        fill (255);
        text (s,200,200,400,400); 
        print(s);
    }  

    if (key == 'a')
    {
        background(242,82,232);
        textSize(40);
        textAlign (CENTER); 
        String a = "you";
        fill (0);
        text (a,200,200,400,400); 
        print(a); 
    }
        
    if (key == 'd')
    {
        background(138,242,138);
        textSize(40);
        textAlign (CENTER); 
        String d = "will follow";
        fill (0);
        text (d,200,200,400,400); 
        print(d);
    }
        
    if (key == 'f') 
    {
        background(242,44,57);
        textSize(40);
        textAlign (CENTER); 
        String f = "society";
        fill (0);
        text (f,200,200,400,400); 
        print(f); 
    }
 
    if (key == CODED) 
    if (keyCode == RIGHT)
    {
        background(216,173,237);
        textSize(40);
        textAlign (CENTER); 
        String r = "dream";
        fill (0);
        text (r,200,200,400,400); 
        print(r);
    } 

     if (key == CODED) 
    if (keyCode == LEFT)
    {
        background(252,173,255);
        textSize(40);
        textAlign (CENTER); 
        String l = "to decide ";
        fill (0);
        text (l,200,200,400,400); 
        print(l);
    } 
        
     if (key == CODED) 
    if (keyCode == DOWN)
    {
        background(250,134,32);
        textSize(40);
        textAlign (CENTER); 
        String n = "time";
        fill (0);
        text (n,200,200,400,400); 
        print(n);
    }
       
     if (key == CODED) 
    if (keyCode == UP)
    {
        background(255);
        textSize(40);
        textAlign (CENTER); 
        String u = "goodbye";
        fill (0);
        text (u,200,200,400,400); 
        print(u); 
    }    

     
    if (keyCode == ' ')
    {
       background(163,197,255);
        String x = " "; 
        print(x);  
       
    }
   
}
  
