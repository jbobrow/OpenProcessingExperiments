
int numLines = 14; // Sonnet form dictates 14 lines.
int numPerm = 4; // How many permutations of each line?

// The poem is composed of 14 lines; here's an array containing them:
string[] sonnetLines = new string[numLines];
// Each of those 14 lines has 4 permutations; we make an array for each line:
string[] line1 = new string[numPerm];
string[] line2 = new string[numPerm];
string[] line3 = new string[numPerm];
string[] line4 = new string[numPerm];
string[] line5 = new string[numPerm];
string[] line6 = new string[numPerm];
string[] line7 = new string[numPerm];
string[] line8 = new string[numPerm];
string[] line9 = new string[numPerm];
string[] line10 = new string[numPerm];
string[] line11 = new string[numPerm];
string[] line12 = new string[numPerm];
string[] line13 = new string[numPerm];
string[] line14 = new string[numPerm];
// 14 (lines) x 4 (permutations per line) = 268,435,456 (possible poems)

void setup() {
  size(800, 600);
  frameRate(60);
  smooth();
  noFill();
  noStroke();
  textAlign(CENTER);

  // Here are all the possible lines:
  line1[0] = "My mistress' eyes are nothing like the sun;";
  line1[1] = "My mistress’ butt is pretty big - now son,";
  line1[2] = "My mistress - well, she is my wife, for one -";
  line1[3] = "My mistress' processors so quickly run,";

  line2[0] = "An apple’s hue puts shame to her lips' red -";
  line2[1] = "I hope you’re hearing what I’ve said -";
  line2[2] = "(“mistress” is like to get me dead)...";
  line2[3] = "She utilizes hyperthread;";

  line3[0] = "At least if Pink Lady is the one;";
  line3[1] = "Yeah, she’s got boobs, they are so fun:";
  line3[2] = "I must needs say, marriage hasn’t been all fun;";
  line3[3] = "Her gleaming chassis’ like unto the sun";

  line4[0] = "Old Granny Smith would hardly do instead!";
  line4[1] = "On luscious pillow I lay my weary head.";
  line4[2] = "Of late I crave the carefree life instead.";
  line4[3] = "(Or so does this compute from what I’ve read).";

  line5[0] = "I bought her roses, red and white,";
  line5[1] = "She rolls high-style, with colors bright";
  line5[2] = "I think on flying solo, soaring like a kite,";
  line5[3] = "I won’t deny, I wish to process with her through the night -";

  line6[0] = "In hopes my gaze her own un-sun-like gaze yet seeks,";
  line6[1] = "(The girl who meets her always freaks);";
  line6[2] = "Rushing o’er the world’s caves and creeks!";
  line6[3] = "Some damage on my CPU desire wreaks -";

  line7[0] = "She chucked them in my face; such was our fight";
  line7[1] = "Don’t mess with this, I warn you, a’ight?";
  line7[2] = "With serendipity I will alight";
  line7[3] = "Wish I for hands to press her buttons right!";

  line8[0] = "It tired us out; yet lo! she and no other speaks:";
  line8[1] = "She’ll break you down like all the geeks.";
  line8[2] = "To find what’er my true heart seeks.";
  line8[3] = "But those advances ‘scape the techno-geeks.";

  line9[0] = "“You snake spittoon!” she shouts. “Well do you know";
  line9[1] = "Her rhymes are fly, she’s got sick flow -";
  line9[2] = "I love this dream...yet well I know";
  line9[3] = "I love to hear her output (heavenly flow!),";

  line10[0] = "“That posies are the best around;";
  line10[1] = "The rappers come from miles around -";
  line10[2] = "That kite by string is locked to ground;";
  line10[3] = "Binary music, that; thank God for sound";

  line11[0] = "“You’re such a poseur - you should go!”";
  line11[1] = "She bests all comers, toe-to-toe;";
  line11[2] = "It flies by care of those who watch below,";
  line11[3] = "Cards! Best of all is that I know";

  line12[0] = "I sat in shame, my pride all lost, not found.";
  line12[1] = "The queen of rhyme she’s ever crowned.";
  line12[2] = "And ‘tis this balance to kitesong gives sound.";
  line12[3] = "It’s just for me, and not the fools around.";

  line13[0] = "Oh poop - I’m as distracted (my story was where?)";
  line13[1] = "Damn! I love that girl, now hear me swear;";
  line13[2] = "And so, though chafe I may, I stay with my love fair;";
  line13[3] = "She needs my RAM - that I will swear.";

  line14[0] = "As any she belied with false compare.";
  line14[1] = "But don’t tell her! Shawty don’t know I care.";
  line14[2] = "Our hearts aligned, life’s challenges we dare.";
  line14[3] = "Now...how to bypass this computer chair?";

  /* Now let's take the lines and draw a random selection to make a poem.
  Random picks any number including floats from zero up to (but not
  including) numPerm, then the int() function converts the result into
  an integer, which corresponds to one of the permutations in the array for
  that line: */
  sonnetLines[0] = line1[int(random(numPerm))];
  sonnetLines[1] = line2[int(random(numPerm))];
  sonnetLines[2] = line3[int(random(numPerm))];
  sonnetLines[3] = line4[int(random(numPerm))];
  sonnetLines[4] = line5[int(random(numPerm))];
  sonnetLines[5] = line6[int(random(numPerm))];
  sonnetLines[6] = line7[int(random(numPerm))];
  sonnetLines[7] = line8[int(random(numPerm))];
  sonnetLines[8] = line9[int(random(numPerm))];
  sonnetLines[9] = line10[int(random(numPerm))];
  sonnetLines[10] = line11[int(random(numPerm))];
  sonnetLines[11] = line12[int(random(numPerm))];
  sonnetLines[12] = line13[int(random(numPerm))];
  sonnetLines[13] = line14[int(random(numPerm))];
}

void draw() {
  background(255);
  fill(0);
  text(sonnetLines[0] + "\n" + sonnetLines[1] + "\n" + sonnetLines[2]
   + "\n" + sonnetLines[3] + "\n" + sonnetLines[4] + "\n" + sonnetLines[5]
    + "\n" + sonnetLines[6] + "\n" + sonnetLines[7] + "\n" + sonnetLines[8]
     + "\n" + sonnetLines[9] + "\n" + sonnetLines[10] + "\n" + sonnetLines[11]
      + "\n" + sonnetLines[12] + "\n" + sonnetLines[13], width/2, height/3);
}



