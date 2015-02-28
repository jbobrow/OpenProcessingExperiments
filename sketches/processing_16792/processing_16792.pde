
int card = 0;  

   

   

PImage ba;  

PImage bb;  

PImage bc;  

PImage bd;  

PImage be;  

PImage bf;  

PImage bg;  

PImage bh;  

PImage bi;  

PImage bj;  

   

   

void setup() {  

  size(700,700);  

   

  smooth();  

  noStroke();  

   

  ba = loadImage("ba.png");  

  bb = loadImage("bb.png");  

  bc = loadImage("bc.png");  

  bd = loadImage("bd.png");  

  be = loadImage("be.png");  

  bf = loadImage("bf.png");  

  bg = loadImage("bg.png");  

  bh = loadImage("bh.png");  

  bi = loadImage("bi.png");  

  bj = loadImage("bj.png");  

}  

void draw() {  

  noStroke();  

  if (card == 0) {  

       

      image(ba, -45, 0,1070,1000) ;  

    stroke(0,200,0,80);    

strokeWeight(5);    

   

  fill(0,10,80);    

   

   

   

quad(342,385,480,435,400,500,265,417);  

   

   

   

   

stroke(255,255,255);    

   

  strokeWeight(5);    

   

  fill(0,70,80);    

   

quad(260,420,400,500,400,665,285,560);  

   

   

   

   

stroke(255,255,500);    

   

  strokeWeight(5);    

   

  fill(0,70,80);    

quad(260,420,400,500,400,665,285,560);  

   

   

   

   

stroke(255,255,500);    

   

  strokeWeight(5);    

   

  fill(0,70,80);    

   

quad(400,500,480,440,460,560,400,660);  

   

   

     

  }  

   

   

 else if (card == 1) {  

     

     

   image(ba, -45, 0, 1070,1000) ;  

   stroke(0,200,0,80);    

   

  strokeWeight(5);    

   

  fill(0,10,80);    

   
quad(342,385,480,435,400,500,265,417);  

stroke(0,0,0,0);  

strokeWeight(5);  

fill(255,255,255);  

   

ellipse(360,430,40,40);  

ellipse(390,465,70,70);  

ellipse(340,460,50,50);  

ellipse(430,480,40,40);  

   

   

   

   

   

stroke(255,255,255);    

   

  strokeWeight(5);    

   

  fill(0,70,80);    

   

quad(260,420,400,500,400,665,285,560);  

   

   

   

   

stroke(255,255,500);    

   

  strokeWeight(5);    

   

  fill(0,70,80);    

   

quad(400,500,480,440,460,560,400,660);  

   

 }  

   

     

if (card == 2) {  

    

image(bc, -69, 0,1186,1000) ;  

        

  }  

     

     

    if (card == 3) {  

     

     image(bd, -45, 0,1070,1000) ;  

        

   }  

      

      if (card == 4) {  

      

     image(be, -45, 0,1070,1000) ;  

        

    }  

    if (card == 5) {  

   

     image(bf, -45, 0,1070,1000) ;  

        

   }  

   

      if (card == 6) {  

   

     image(bg, -45,0,1070,1000) ;   
}  

      

      if (card == 7) {  

   

     image(bh, -45, 0,1070,1000) ;    

        

        

     }  

      if (card == 8) {  

    

     image(bi, -45, 0,1070,1000) ;  

        

        

       }  

          

         if (card == 9) {  

    

     image(bj, -45, 0,1070,1000) ;  

        

        

         }  

         }   

 void mousePressed() {  

              

           if (card == 0) {  

              card = 1;  

           }  

           else if (card == 1) {      

   

    card = 2;    

   

  }    

   

  else if (card == 2) {    

   

    card = 3;    

   

  }    

   

  else if (card == 3) {    

   

    card = 4;    

   

  }      

   

  else if (card == 4) {    

   

    card = 5;    

   

  }      

 else if (card == 5) {    

   

    card = 6;    

   

  }     

   

  else if (card == 6) {    

   

    card = 7;    

   

  }    

   

  else if (card == 7) {    

   

    card = 8;   

   

  }    

   

  else if (card == 6) {    

   

    card = 7;    

   

  }    

   

  else if (card == 7) {    

   

    card = 8;   

   

  }    

   

  else if (card == 6) {    

   

    card = 7;    

   

  }    

   

  else if (card == 7) {    

   

    card = 8;   

   

  }    

   

  else if (card == 6) {    

   

    card = 7;    

   

  }    

   

  else if (card == 7) {    

   

    card = 8;   

   

  }    

   

    

  else if (card == 6) {    

   

    card = 7;    

   

  }    

   

  else if (card == 7) {    

   

    card = 8;   

   

  }    

   

 else if(card == 8) {  

      

   card = 9;  

      

 }  

 else if (card == 9) {  

   card = 0;  

      

 }  

    

}  

   

  

