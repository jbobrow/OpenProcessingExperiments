
int mode = 1;     // ---introduce mode 1



PFont font;           //--the text/short story/logic game
String a = "You wake up in a white room with a splitting headache unsure of where you are or how you got there.";
String b = "In fact, you remember nothing of your past life. This room has no discernable windows or doors."; 
String c = "You lie on the floor, looking up at the ceiling... next to you lies a GLASS OF WATER and a PISTOL.";
String d = "Which do you examine? Press 1 to examine the glass or 2 to examine the pistol.";
String e1 = "The water is crisp, clean, and inviting. At the mere sight of it, your throat becomes like cotton and"; 
String f1 = "your lips crack. You are undeniably thirsty But you did not notice this until staring at the water.";
String g1 = "Your mind tells you that if you do not drink this water immediately, you will die violently.";
String h1 = "Do you 3 -- drink the water or 4 -- shatter the glass?";
String i1 = "You greedily swallow all of the water quickly, and your throat welcomes the ice-cold embrace as would a";
String j1 = "a dying man stuck wandering amid Death Valley. As you finish the glass, the walls dissolve around you.";
String k1 = "You are surrounded by a wall of fire. Your blood boils and your skin turns black.";
String l1 = "You let out a dying scream of agony that no-one hears.";
String i2 = "You pick up the full glass of water and stare at it before crushing it with your right hand and watching";
String j2 = "the bits of glass cut deeply into your hand causing severe lacerations that immediately makes you lightheaded";
String k2 = "You fall to the floor, gasping for air, throat and lips dry and cracking worse than before. As you bleed out,";
String l2 = "you can not make a sound. As the life leaves you, you grow cold and resent the nothingness arond you.";
String e2 = "Picking up the cold piece of metal with your right hand sends a shiver down to the base of your spine.";
String f2 = "You instinctively cock back the slide to check the chamber, finding it loaded, eject the clip and count";
String g2 = "14 rounds .45ACP. You look up and the room has grown larger, extending back 50 yards from whence you stand.";
String h2 = "At the other end of the room is a man-shaped target. Do you 5-- fire at the target or 6-- through your temple?";
String m1 = "You aim the .45 with skill and precision. Aiming at the head of the target, your hand does not shake and your";
String n1 = "eyes do not twitch. You take a deep breath and exhale slowly, firing the weapon at the midpoint of the exhaled";
String o1 = "breath. The shot is deafening and you feel a stickly warm liquid drip from your ears. You walk to the end of";
String p1 = "the hallway and examine the target. It is a direct hit through the center of the skull. You bring your right";
String q1 = "hand to your face and feel a gaping wound in the center of your fore-head. You collapse without making a sound";
String r1 = "enter the void...";
String m2 = "You point the loaded .45 at your right temple and immediately pull the trigger. Your vision turns black";
String n2 = "for a single frame. You look around you and see rows upon rows of grandiose Cyprus trees. The smell of living";
String o2 = "things permeates across your soul. You walk for miles and come across fruits, berries, and vegetables of every";
String p2 = "possible denomination. You still do not know who or what you are, but you are content, and that is enough.";

void setup(){
  smooth();
  size(1060,600);
  
  font = loadFont("SynchroLET-18.vlw");
  textFont(font);
  fill (15,90,9);
  
}






void draw(){                          //-------the placement of the text with modes
  if(mode == 1){
  background(0,0,0);
 
  text(a, 20,40);
  text(b, 20,60);
  text(c, 20,80);
  text(d, 20,100);
  }if(mode == 2){
    background (0,0,0);
    text(a, 20,120);
  text(b, 20,140);
  text(c, 20,160);
  text(d, 20,180);
  text(e1 ,20,220);
  text(f1 ,20,240);
  text(g1 ,20,260);
  text(h1 ,20,280);
  } else if(mode == 3){
 
    text(e2 ,20,140);
    text(f2 ,20,160);
    text(g2 ,20,180);
    text(h2 ,20,200);
    
  } if(mode == 4){
    
    background (0,0,0);
   
  text(i1 ,20,300);
  text(j1 ,20,320);
  text(k1 ,20,340);
  text(l1 ,20,360);
  
  } if (mode == 5){
    
    background (0,0,0);
   
  text(i2 ,20,300);
  text(j2 ,20,320);
  text(k2 ,20,340);
  text(l2 ,20,360);
  
  }if (mode == 6){
    
    background (0,0,0);
   
  text(m1 ,20,300);
  text(n1 ,20,320);
  text(o1 ,20,340);
  text(p1 ,20,360);
  text(q1 ,20,380);
  text(r1 ,20,400);
  }if (mode == 7){
    
    background (0,0,0);
   
  text(m2 ,20,300);
  text(n2 ,20,320);
  text(o2 ,20,340);
  text(p2 ,20,360);
  }
}




void keyPressed(){                 //-----the changing of the modes
  if(mode == 1 && (key == '1')){
    mode = 2;
  }
   if(mode == 1 && (key == '2')){
    mode = 3;
  }
  if(mode == 2 && (key == '3')){
    mode = 4;
  }
   if(mode == 2 && (key == '4')){
    mode = 5;
   }
   if(mode == 3 && (key == '5')){
     mode = 6;
   }
   if(mode == 3 && (key == '6')){
     mode = 7;
   }
}

