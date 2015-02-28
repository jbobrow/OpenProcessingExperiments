
PImage img;
int mode = 1;     // ---introduce mode 1

import ddf.minim.*;
import ddf.minim.signals.*;

Minim minim;
AudioOutput out;
WhiteNoise wn;


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
String q = "You walk along the forest for many days... fog begins to set in. It becomes so thick that you cannot see five";
String r = "feet in front of you. You begin to feel exhausted. The ground is dry and there are many small branches and leaves";
String s = "around do you 7-- make a fire or 8-- sleep in the dark?";
String t1 = "You gather kindling and set up various small branches in a ring around the kindling but realize as soon as you";
String u1 = "finish setting it all up that you have no means at your disposal in order to start a fire. As you ponder the";
String v1 = "solution, you hear a noise from behind you that sets your teeth on edge. You spin around and see a thin man in a";
String w1 = "black robe holding a staff. You still have 13 shots left in the .45."; 
String x1 = "You can either s-- shoot the man, c-- call out to him, or r--remain silent";
String t2 = "You decide to hunker down for the night among the forest floor in the dark with no shelter. An hour into the";
String u2 = "night you begin to shiver uncontrollably so you get up a jog around in order to stay warm. You hear scratching and";
String v2 = "growling off into the distance. You scream and yell to scare the monsters away. The growling inches ever closer,";
String w2 = "despite your efforts. Truly frightened, you lean against a tree and bury your head into your hands pretending";
String x2 = "to not hear the hungry growls circle around you just waiting for the perfect moment to strike. The low growls";
String y2 = "turn into high-pitched squeals before becoming completely silent. You look up apprehensively and see nothing.";
String z2 = "Foolishly triumphant, you shake your fist up at the fog and as you do, the fog shifts and the moon comes out";
String z3 = "Shedding light all around you. That is when you see them... grotesque animals that look like a cross between a";
String z4 = "hyena and a velociraptor with blood dripping down its giant fangs. You swallow hard. They all lunge at you at";
String z5 = "the same time and rip apart your entrails. Before you can scream one of the monsters slices your throat";
String z6 = "rendering you helpless but defintely still alive as they tear you to pieces. You watch them eat you alive";
String s2 = "Not caring who this person is, you aim at his heart and pull the trigger. As soon as you fire, he disappears.";
String s3 = "He reappears instantly in front of your face and slits your throat with a short knife made of bone.";
String s4 = "You bleed out on to the grass gargling some unintelligible nonesense";
String c2 = "As soon as you open your mouth in order to shout a basic form of greeting, the dark figure raises his staff";
String c3 = "and points it directly at you causing your esophagus to swell up. Not only can you no longer make a sound,";
String c4 = "you are completely unable to breathe. Your face turns red and your lips turn blue. You fall to your knees";
String c5 = "and sufficate to death.";
String r2 = "You watch as the lone dark figure steps towards you, never locking eyes with you, each step echoing across";
String r3 = "the forest until finally he is right in front of you and stares directly into your eyes. A long moment of silence.";
String r4 = "'Do you want to go home?' He says, 'If so step into the portal it will take you back to the city you were born.'";
String r5 = "A small blue orb appears in front of you, it grows into wide tear in the universe. You see nothing on the other";
String r6 = "side... just a deep blue tartarus pit ready to suck you in.";
String r7 = "Do you step into the portal? y or n?";
String p3 = "An expansive city opens up around you with smoke billowing in every direction. It smells of death and commerce.";
String z9 = "Press z to be free";
String p4 = "The shadowy figure forms a ball of ice in his hands and molds it into a spear which he hurls into your neck.";
String p5 = "You look down and see your own blood spread across the forest floor but you feel no pain The Dark Man walks";
String p6 = "up to you and caresses the side of your cheek lovingly before making two small ice spikes and jams them cruelly";
String p7 = "into both of your eyes... this pain you feel. You sprint off into the wilderness and run around aimlessly for"; 
String p8 = "hours, hearing his maddening laughter wherever you go, before finally succumbing to exhaustion.";
String p9 = "You die blind, cold, and alone.";

void setup(){
  smooth();
  size(1060,600);
  img = loadImage("Midgar.jpg");
  font = loadFont("SynchroLET-18.vlw");
  textFont(font);
  fill (15,90,9);
  {
  
  minim = new Minim(this);
  out = minim.getLineOut();
  // makes a WhiteNoise signal with an amplitude of 0.2
  wn = new WhiteNoise(0.01);
  // adds the signal to the output
  out.addSignal(wn);
}
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
  text(q ,20,400);
  text(r ,20,420);
  text(s ,20,440);
  }if (mode == 8){
    
    background (0,0,0);
   
  text(t1 ,20,300);
  text(u1 ,20,320);
  text(v1 ,20,340);
  text(w1 ,20,360);
  text(x1 ,20,400);
  }if (mode == 9){
    
    background (0,0,0);
   
  text(t2 ,20,300);
  text(u2 ,20,320);
  text(v2 ,20,340);
  text(w2 ,20,360);
  text(x2 ,20,380);
  text(y2 ,20,400);
  text(z2 ,20,420);
  text(z3 ,20,440);
  text(z4 ,20,460);
  text(z5 ,20,480);
  text(z6 ,20,500);
  }if (mode == 10){
    
    background (0,0,0);
   
 
  text(s2 ,20,340);
  text(s3 ,20,360);
  text(s4 ,20,400);
  }if (mode == 11){
    
    background (0,0,0);
   
  
  text(c2 ,20,320);
  text(c3 ,20,340);
  text(c4 ,20,360);
  text(c5 ,20,400);
  }if (mode == 12){
    
    background (0,0,0);
   
  
  text(r2 ,20,320);
  text(r3 ,20,340);
  text(r4 ,20,360);
  text(r5 ,20,380);
  text(r6 ,20,400);
  text(r7 ,20,440);
}if (mode == 13){
    
    background (0,0,0);
   
  
  
  text(p3 ,20,440);
  text(z9 ,20,500);
}if (mode == 14){
    
    background (0,0,0);
   
  
 
  text(p4 ,20,400);
  text(p5 ,20,420);
  text(p6 ,20,440);
  text(p7 ,20,460);
  text(p8 ,20,480);
  text(p9 ,20,520);
}if (mode == 15){
  
    image(img, 20, -100);

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
    if(mode == 7 && (key == '7')){
    mode = 8;
  }
   if(mode == 7 && (key == '8')){
    mode = 9;
  }
  if(mode == 8 && (key == 's')){
    mode = 10;
  }
   if(mode == 8 && (key == 'c')){
    mode = 11;
   }
   if(mode == 8 && (key == 'r')){
     mode = 12;
   }
   if(mode == 12 && (key == 'y')){
     mode = 13;
   }
   if(mode == 12 && (key == 'n')){
     mode = 14;
   }
   if(mode == 13 && (key == 'z')){
     mode = 15;
   }
}

void stop()
{
  out.close();
  minim.stop();
  
  super.stop();
}

