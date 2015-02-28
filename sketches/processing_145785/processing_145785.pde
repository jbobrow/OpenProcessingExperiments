
Hand hnd;
void setup(){
   size(500,400);
   fill(140,90,14);
   rect(0,250,500,500);
   fill(255);
   rect(187.5,25,125,200);
   fill(150);
   rect(187.5 + 14, 25 + 14, 125 - 2*14, 125/3);
   Hand h = new Hand();
   hnd = h;
   h.display();
   fill(255);
   text("left", 30, 30, 50, 40);
   text("right", 500 - 2*30, 30, 50, 40);
}
void draw(){
}
void mouseClicked() {
  for (int i = 0; i<4; i++) {
    if (hnd.myhand[i].isover()) {
       
      println(hnd.myhand[i].myX);
      println(hnd.myhand[i].myY);
      println(hnd.myhand[i].title);
      hnd.myhand[i].toggle();
    }
  }
  if (mouseX>30 && mouseY>30 && mouseX<80 && mouseY<70) {
     hnd.shift(false);
  }
  if (mouseX>(500-2*30) && mouseY>30 && mouseX<490 && mouseY<70) {
     hnd.shift(true);
  }
  hnd.display();
}
class Card {
   int sizeX = 65;
   int sizeY = 104;
   int myX = 0;
   int myY = 0;
   String title = "Stub";
   int xoffset = 7;
   int yoffset = 7;
   int player = 0;   
   Card (int x, int y, Card c) {
     myX = x;
     myY = y;
     title = c.title;
     player = c.player;
   }
   Card (String t, int p) {  //constructor overload
     title = t;
     player = p;
   }
   boolean isover() {
     return (mouseX>myX && mouseY>myY && mouseX< (myX + sizeX) && mouseY < (myY + sizeY));
   }
   void setfill () {
     switch (player) {
       case 0:
         fill(255,0,0);
       case 1:
         fill(0,255,0);
       case 2:
         fill(0,0,255);
     }
   }
   void display () {
     setfill();
     rect(myX,myY,sizeX,sizeY);
     fill(150);
     text(title, myX + xoffset, myY + yoffset, sizeX - 2*xoffset, sizeX/3);
   }
   void toggle () {
     setfill();
     rect(187.5,25,125,200);
     fill(150);
     rect(187.5 + 14, 25 + 14, 125 - 2*14, 125/3);
     fill(255);
     text(title, 187.5 + 14, 25 + 14, 125 - 2*14, 125/3);
   }
}
class Hand {
   ArrayList<Card> deck = new ArrayList<Card>();
   int startpointer = 0;
   //int endpointer = 3;
   Card[] myhand = new Card[4];
   Hand () {
     Card c1 = new Card("1st Card", 0);
     Card c2 = new Card("2nd Card", 0);
     Card c3 = new Card("3rd Card", 0);
     Card c4 = new Card("4th Card", 0);
     Card c5 = new Card("5th Card", 0);
     deck.add(c1);
     deck.add(c2);
     deck.add(c3);
     deck.add(c4);
     deck.add(c5);
     myhand[0] = c1;
     myhand[1] = c2;
     myhand[2] = c3;
     myhand[3] = c4;
   }
   int circularmod(int a, int b) {
      if (a >= 0) {
       return a%b;
      } else {
        println(a);
        if ((abs(a))%b == 0) {
           return 0; 
        }
       return -1*((abs(a))%b) + (b);
      }
   }
   void shift(boolean right){
     if (right) {
       startpointer--;
     } else {
       startpointer++;
     }
     Card c1 = deck.get(circularmod((startpointer), deck.size()));
     Card c2 = deck.get(circularmod((startpointer + 1), deck.size()));
     Card c3 = deck.get(circularmod((startpointer + 2), deck.size()));
     Card c4 = deck.get(circularmod((startpointer + 3), deck.size()));
     myhand[0] = c1;
     myhand[1] = c2;
     myhand[2] = c3;
     myhand[3] = c4;
   }
   void display() {
     Card c2 = new Card (30 + 125, 250 + 23, myhand[1]);
     Card c3 = new Card (30 + 125*2, 250 + 23, myhand[2]);
     Card c4 = new Card (30 + 125*3, 250 + 23, myhand[3]);
     Card c1 = new Card (30, 250 + 23, myhand[0]);
     myhand[0] = c1;
     myhand[1] = c2;
     myhand[2] = c3;
     myhand[3] = c4;
     c1.display();
     c2.display();
     c3.display();
     c4.display();
   }
   void shuffle(){};
}
 



