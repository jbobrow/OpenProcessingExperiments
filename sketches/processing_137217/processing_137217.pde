
float timer = 0.00;
float x= 0;
float x2 = 0;
float x3 = 0;
float x4 = 0;

void setup()
{
  size(500,500);
}

void draw()
{
  background(255);
  x= x + 1;
  timer = timer + (1.0/30);

  fill(0,255,150);
  textSize(32);
  text("Beloved",(510 - x),150);
    
  fill(255,192,214);
  textSize(24);
  text("Kind",(530-x), 250);

  fill(255,3,3);
  textSize(18);
  text("Confident", (570 - x), 450);
  
  fill(255,118,39);
  textSize(18);
  text("Wise", (600 - x), 50);
  
  fill(255,200,36);
  textSize(52);
  text("Happy", (700 - x), 250);
  
  fill(173,255,254);
  textSize(42);
  text("Artistic", (800 - x), 375);
  
  fill(200,0,255);
  textSize(26);
  text("Cheerful", (900 - x), 150);
  
  fill(255,58,4);
  textSize(23);
  text("Brave", (875 - x), 75);
  
  fill(131,255,15);
  textSize(34);
  text("Considerate", (925 - x), 200);
  
  fill(255,162,195);
  textSize(29);
  text("Beautiful", (670 - x), 350);
  
  fill(255,17,4);
  textSize(52);
  text("Sucessful", (950 - x), 470);
  
  fill(23,255,93);
  textSize(25);
  text("Humorous", (930 - x), 275);
  
  fill(82,0,63);
  textSize(47);
  text("Emotional", (1050 - x), 400);
  
  fill(23,82,0);
  textSize(25);
  text("Clumsy", (970 - x), 75);
  
  fill(41,0,84);
  textSize(25);
  text("Timid", (1100 - x), 150);
  
  fill(0,75,84);
  textSize(20);
  text("Childish", (1150 - x), 250);
  
  fill(84,1,13);
  textSize(28);
  text("Weird", (1175 - x), 200);
  
  fill(84,34,1);
  textSize(23);
  text("Frivolous", (1175 - x), 50);
  
  fill(0,43,84);
  textSize(28);
  text("Awkward", (1200 - x), 325);
  
  fill(37,75,82);
  textSize(18);
  text("Grumpy", (1300 - x), 150);
  
  if (timer > 28)
  {
    x2 = x2 + 2;
  }
  fill(82,70,255);
  textSize(20);
  text("Stubborn", (510 - x2), 300);
  
  fill(186,85,135);
  textSize(28);
  text("Complex", (570 - x2), 450);
  
  fill(74,84,45);
  textSize(23);
  text("Doubtful", (540 - x2), 63);
  
  fill(84,67,37);
  textSize(25);
  text("Fearful", (525- x2), 275);
  
  fill(84,36,42);
  textSize(20);
  text("Dull", (625- x2), 150);
  
  fill(76,65,84);
  textSize(32);
  text("Indifferent", (675- x2), 325);
  
  fill(61,84,46);
  textSize(25);
  text("Stingy", (650- x2), 250);
  
  fill(31,72,84);
  textSize(34);
  text("Dishonest", (710- x2), 470);
  
  fill(84,59,82);
  textSize(18);
  text("Critical", (600- x2), 235);
  
  fill(84,41,34);
  textSize(29);
  text("Fool", (667- x2), 475);
  
  fill(84,67,55);
  textSize(33);
  text("Hesitant", (725- x2), 420);
  
  fill(84,67,37);
  textSize(38);
  text("Unnoteworthy", (750- x2), 250);
  
  fill(84,83,84);
  textSize(28);
  text("Unrefined", (730- x2), 166);
  
  fill(84,16,1);
  textSize(52);
  text("Impatient", (740- x2), 95);
  
  fill(84,0,62);
  textSize(34);
  text("Dumb", (725- x2), 130);
  
  fill(0,3,84);
  textSize(36);
  text("Skeptical", (755- x2), 390);
  
  fill(84,78,0);
  textSize(31);
  text("Fearful", (745- x2), 280);
  
  fill(84,48,1);
  textSize(34);
  text("Cocky", (860- x2), 430);
  
  fill(0,84,77);
  textSize(28);
  text("Anxious", (800- x2), 360);
  
  fill(84,1,23);
  textSize(37);
  text("Negative", (800- x2), 200);
  
  if (timer > 35)
  {
    x3 = x3 + 3;
  }
  
  fill(84,67,37);
  textSize(34);
  text("Stupid", (510- x3), 75);
  
  fill(33,6,0);
  textSize(42);
  text("Dishonorable", (525- x3), 475);
  
  fill(31,33,0);
  textSize(38);
  text("Untrustworthy", (534- x3), 275);
  
  fill(29,0,33);
  textSize(52);
  text("Empty", (529- x3), 320);
  
  fill(31,33,0);
  textSize(45);
  text("Boastful", (528- x3), 420);
  
  fill(33,16,20);
  textSize(36);
  text("Ugly", (542- x3), 340);
  
  fill(33,14,0);
  textSize(45);
  text("Reckless", (530- x3), 150);
  
  fill(33,30,18);
  textSize(30);
  text("Rude", (600- x3), 305);
  
  fill(15,33,10);
  textSize(48);
  text("Irrelevant", (580- x3), 430);
  
  fill(33,13,8);
  textSize(35);
  text("Lustful", (644- x3), 220);
  
  fill(14,24,33);
  textSize(38);
  text("Fiendish", (630- x3), 340);
  
  fill(23,33,17);
  textSize(52);
  text("Unreliable", (770- x3), 220);
  
  fill(33,32,11);
  textSize(60);
  text("Crude", (680- x3), 75);
  
  fill(33,18,21);
  textSize(55);
  text("Corrupt", (850- x3), 360);
  
  fill(33,15,8);
  textSize(42);
  text("Self-Centered", (820- x3), 420);
  
  fill(33,31,12);
  textSize(48);
  text("Malicious", (750- x3), 175);
  
  fill(23,33,32);
  textSize(50);
  text("Coarse", (800- x3), 260);
  
  fill(29,25,33);
  textSize(46);
  text("Fractious", (835- x3), 475);
  
  fill(33,31,27);
  textSize(38);
  text("Sorrow", (1000- x3), 300);
  
  fill(33,25,28);
  textSize(55);
  text("Coward", (920- x3), 120);
  
  fill(25,0,33);
  textSize(66);
  text("Hateful", (940- x3), 450);
  
  fill(33,9,1);
  textSize(62);
  text("Cruel", (880- x3), 380);
  
  fill(15,3,0);
  textSize(52);
  text("Wicked", (1050- x3), 50);
  
  fill(15,14,0);
  textSize(64);
  text("Abnormal", (1020- x3), 264);
  
  fill(1,0,15);
  textSize(56);
  text("Angry", (960- x3), 345);
  
  fill(15,0,4);
  textSize(66);
  text("Vulger", (1100- x3), 436);
  
  fill(11,15,0);
  textSize(38);
  text("Petty", (1130- x3), 485);
  
  fill(0,15,4);
  textSize(56);
  text("Envious", (1098- x3), 160);
  
  fill(15,0,13);
  textSize(67);
  text("Cynical", (1005- x3), 220);
  
  fill(15,4,0);
  textSize(63);
  text("Vicious", (1050- x3), 285);
  
  fill(15,10,0);
  textSize(55);
  text("Vain", (1070- x3), 405);
  
  fill(15,10,8);
  textSize(50);
  text("Emotionless", (935- x3), 26);
  
  fill(15,8,15);
  textSize(61);
  text("Materialistic", (960- x3), 200);
  
  fill(11,15,6);
  textSize(45);
  text("Inflexable", (986- x3), 300);
  
  fill(5,10,15);
  textSize(57);
  text("Indecent", (995- x3), 400);
  
  fill(15,13,13);
  textSize(63);
  text("Inconsiderate", (1015- x3), 460);
  
  fill(15,1,3);
  textSize(38);
  text("Obtuse", (860- x3), 320);
  
  fill(0,15,13);
  textSize(38);
  text("Acute", (900- x3), 180);
  
  fill(4,15,0);
  textSize(38);
  text("Intolerant", (940- x3), 450);
  
  fill(15,11,0);
  textSize(42);
  text("Blunt", (980- x3), 325);
  
  fill(15,7,12);
  textSize(54);
  text("Jealous", (750- x3), 245);
  
  fill(15,8,7);
  textSize(50);
  text("Rash", (680- x3), 132);
  
  fill(10,15,11);
  textSize(62);
  text("Frail", (790- x3), 364);
  
  fill(12,7,15);
  textSize(58);
  text("Stoic", (840- x3), 435);
  
  fill(15,10,10);
  textSize(43);
  text("Greedy", (545- x3), 167);
  
  fill(15,12,6);
  textSize(47);
  text("Shallow", (580- x3), 210);
  
  fill(9,15,15);
  textSize(50);
  text("Unstable", (620- x3), 328);
  
  fill(15,8,12);
  textSize(53);
  text("Incompetant", (700- x3), 436);
  
  fill(15,10,7);
  textSize(45);
  text("Single- Mined", (720- x3), 100);
  
  fill(15,7,12);
  textSize(47);
  text("Prejediced", (760- x3), 125);
  
  fill(13,15,8);
  textSize(42);
  text("Fickle", (745- x3), 180);
  
  fill(15,10,0);
  textSize(49);
  text("Ruthless", (690- x3), 345);
  
  fill(0);
  textSize(46);
  text("Cold", (520- x3), 240);
  
  fill(0);
  textSize(53);
  text("Wimpy", (570- x3), 285);
  
  fill(0);
  textSize(57);
  text("Lazy", (640- x3), 378);
  
  fill(0);
  textSize(60);
  text("Dogmatic", (660- x3), 432);
  
  fill(0);
  textSize(48);
  text("Prideful", (720- x3), 225);
  
  fill(0);
  textSize(56);
  text("Glutinous", (755- x3), 323);
  
  fill(0);
  textSize(59);
  text("Self-Indulgent", (807- x3), 445);
  
  fill(0);
  textSize(61);
  text("Repulsive", (920- x3), 156);
  
  fill(0);
  textSize(63);
  text("Oppressive", (515- x3), 367);
  
  fill(0);
  textSize(48);
  text("Obnoxious", (972- x3), 215);
  
  fill(0);
  textSize(58);
  text("Odious", (1020- x3), 323);
  
  fill(0);
  textSize(60);
  text("Perverse", (1045- x3), 378);
  
  fill(0);
  textSize(50);
  text("Sullen", (1010- x3), 400);
  
  fill(0);
  textSize(51);
  text("Sulky", (1008- x3), 478);
  
  fill(0);
  textSize(49);
  text("Shrewish", (1015- x3), 50);
  
  fill(0);
  textSize(51);
  text("Apatheic", (1115- x3), 203);
  
  fill(0);
  textSize(55);
  text("Domineering", (1130- x3), 320);
  
  fill(0);
  textSize(64);
  text("Erratic", (1140- x3), 405);
  
  fill(0);
  textSize(62);
  text("Uncertain", (1013- x3), 487);
  
  fill(31,0,230);
  textSize(50);
  text("Secrets", (880- x3), 190);
  
  fill(98,163,1);
  textSize(63);
  text("Lies", (640- x3), 270);
  
  fill(198,173,2);
  textSize(66);
  text("Irrational", (960- x3), 325);
  
  fill(277,3,3);
  textSize(55);
  text("Weaknesses", (530- x3), 450);
  
  if (timer > 45)
  {
    x4 = x4 + 1;
  }
  
  fill(242,130,154);
  textSize(20);
  text("Patient", (510- x4), 250);
  
  fill(242,107,23);
  textSize(25);
  text("Nimble", (630- x4), 62);
  
  fill(242,194,1);
  textSize(32);
  text("Generous", (660- x4), 140);
  
  fill(192,0,242);
  textSize(23);
  text("Up Beat", (700- x4), 340);
  
  fill(242,0,218);
  textSize(18);
  text("Reliable", (750- x4), 400);
  
  fill(28,242,0);
  textSize(27);
  text("Positive", (735- x4), 467);
  
  fill(78,242,168);
  textSize(25);
  text("Humble", (810- x4), 435);
  
  fill(149,144,242);
  textSize(28);
  text("Charming", (820- x4), 350);
  
  fill(242,130,99);
  textSize(23);
  text("Charitable", (760- x4), 280);
  
  fill(242,81,99);
  textSize(20);
  text("Elegant", (745- x4), 167);
  
  fill(242,158,2);
  textSize(19);
  text("Tactful", (800- x4), 200);
  
  fill(242,2,106);
  textSize(28);
  text("Attractive", (790- x4), 75);
  
  fill(164,242,20);
  textSize(23);
  text("Gentle", (860- x4), 120);
  
  fill(116,242,242);
  textSize(25);
  text("Generous", (850- x4), 170);
}


