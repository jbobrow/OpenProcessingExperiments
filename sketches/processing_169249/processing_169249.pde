
// Obique Strategies
PFont font;
String [] oblique = new String[117]; // las estrategias

int strat = 116;

void setup() {
  font = loadFont("AvenirNext-UltraLight-48.vlw");
  strategies();
  size (1200, 400, P2D);
  background(0);
 // smooth();
  textAlign(CENTER, CENTER);

}

void draw () {
  textFont(font, 30);
  text(oblique[strat], width/2, height/2);
  if (mousePressed) {
    
     strat = int(random(oblique.length));    
     
     background(0);

  }
}
  
  
  
  


//Extract from http://www-pub.naz.edu:9000/~jturner9/EnoObliqStrat1.pdf

void strategies (){

oblique[0]="Abandon normal instruments";
oblique[1]="Accept advice";
oblique[2]="Accretion";
oblique[3]="A line has two sides";
oblique[4]="Allow an easement (an easement is the abandonment of a stricture)";
oblique[5]="Are there sections? Consider transitions";
oblique[6]="Ask people to work against their better judgement";
oblique[7]="Ask your body";
oblique[8]="Assemble some of the instruments in a group and treat the group";
oblique[9]="Balance the consistency principle with the inconsistency principle";
oblique[10]="Be dirty";
oblique[11]="Breathe more deeply";
oblique[12]="Bridges -build -burn";
oblique[13]="Cascades";
oblique[14]="Change instrument roles";
oblique[15]="Change nothing and continue with immaculate consistency";
oblique[16]="Children's voices -speaking -singing";
oblique[17]="Cluster analysis";
oblique[18]="Consider different fading systems";
oblique[19]="Consult other sources -promising -unpromising";
oblique[20]="Convert a melodic element into a rhythmic element";
oblique[21]="Courage!";
oblique[22]="Cut a vital connection";
oblique[23]="Decorate, decorate";
oblique[24]="Define an area as `safe' and use it as an anchor";
oblique[25]="Destroy -nothing -the most important thing";
oblique[26]="Discard an axiom";
oblique[27]="Disconnect from desire";
oblique[28]="Discover the recipes you are using and abandon them";
oblique[29]="Distorting time";
oblique[30]="Do nothing for as long as possible";
oblique[31]="Don't be afraid of things because they're easy to do";
oblique[32]="Don't be frightened of cliches";
oblique[33]="Don't be frightened to display your talents";
oblique[34]="Don't break the silence";
oblique[35]="Don't stress one thing more than another";
oblique[36]="Do something boring";
oblique[37]="Do the washing up";
oblique[38]="Do the words need changing?";
oblique[39]="Do we need holes?";
oblique[40]="Emphasize differences";
oblique[41]="Emphasize repetitions";
oblique[42]="Emphasize the flaws";
oblique[43]="Faced with a choice, do both (given by Dieter Rot)";
oblique[44]="Feedback recordings into an acoustic situation";
oblique[45]="Fill every beat with something";
oblique[46]="Get your neck massaged";
oblique[47]="Ghost echoes";
oblique[48]="Give the game away";
oblique[49]="Give way to your worst impulse";
oblique[50]="Go slowly all the way round the outside";
oblique[51]="Honor thy error as a hidden intention";
oblique[52]="How would you have done it?";
oblique[53]="Humanize something free of error";
oblique[54]="Imagine the music as a moving chain or caterpillar";
oblique[55]="Imagine the music as a set of disconnected events";
oblique[56]="Infinitesimal gradations";
oblique[57]="Intentions -credibility of -nobility of -humility of";
oblique[58]="Into the impossible";
oblique[59]="Is it finished?";
oblique[60]="Is there something missing?";
oblique[61]="Is the tuning appropriate?";
oblique[62]="Just carry on";
oblique[63]="Left channel, right channel, centre channel";
oblique[64]="Listen in total darkness, or in a very large room, very quietly";
oblique[65]="Listen to the quiet voice";
oblique[66]="Look at a very small object, look at its centre";
oblique[67]="Look at the order in which you do things";
oblique[68]="Look closely at the most embarrassing details and amplify them";
oblique[69]="Lowest common denominator check -single beat -single note -single";
oblique[70]="riff";
oblique[71]="Make a blank valuable by putting it in an exquisite frame";
oblique[72]="Make an exhaustive list of everything you might do and do the last";
oblique[73]="thing on the list";
oblique[74]="Make a sudden, destructive unpredictable action; incorporate";
oblique[75]="Mechanicalize something idiosyncratic";
oblique[76]="Mute and continue";
oblique[77]="Only one element of each kind";
oblique[78]="(Organic) machinery";
oblique[79]="Overtly resist change";
oblique[80]="Put in earplugs";
oblique[81]="Remember those quiet evenings";
oblique[82]="Remove ambiguities and convert to specifics";
oblique[83]="Remove specifics and convert to ambiguities";
oblique[84]="Repetition is a form of change";
oblique[85]="Reverse";
oblique[86]="Short circuit (example: a man eating peas with the idea that they will";
oblique[87]="improve his virility shovels them straight into his lap)";
oblique[88]="Shut the door and listen from outside";
oblique[89]="Simple subtraction";
oblique[90]="Spectrum analysis";
oblique[91]="Take a break";
oblique[92]="Take away the elements in order of apparent non-importance";
oblique[93]="Tape your mouth (given by Ritva Saarikko)";
oblique[94]="The inconsistency principle";
oblique[95]="The tape is now the music";
oblique[96]="Think of the radio";
oblique[97]="Tidy up";
oblique[98]="Trust in the you of now";
oblique[99]="Turn it upside down";
oblique[100]="Twist the spine";
oblique[101]="Use an old idea";
oblique[102]="Use an unacceptable color";
oblique[103]="Use fewer notes";
oblique[104]="Use filters";
oblique[105]="Use `unqualified' people";
oblique[106]="Water";
oblique[107]="What are you really thinking about just now? Incorporate";
oblique[108]="What is the reality of the situation?";
oblique[109]="What mistakes did you make last time?";
oblique[110]="What would your closest friend do?";
oblique[111]="What wouldn't you do?";
oblique[112]="Work at a different speed";
oblique[113]="You are an engineer";
oblique[114]="You can only make one dot at a time";
oblique[115]="You don't have to be ashamed of using your own ideas";
oblique[116]="Blank";


}


