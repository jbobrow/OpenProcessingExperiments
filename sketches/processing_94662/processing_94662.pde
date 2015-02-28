
//**************************
// INTRO
//************************** 
/* 

Created by Dan Hawkins, drhawkin@sfu.ca March 18th 2013

Random images + text (comic) generator
Generator uses text from JayZ, Biggie and Tupac lyrics based on the Keywords from the film The Master
The Master film images provided by http://film-grab.com/movies-a-z/

If you discover any funny/interesting comibinations,
please tweet me @dockhands #dogbrunch

visit http://dogsbrunch.tumblr.com/ for more funnies

*/

//**************************
// Global Variables
//************************** 
PFont font;
int imgW = 512; // width of the image stills
int imgH = 238; // height of the image stills

//float speed = 0.08;

PImage[] imgMaster = new PImage[31];
PImage jayZpic;
PImage biggiePic;
PImage tupacPic;
PImage fiftyCent;

boolean jayzButton = false;
boolean biggieButton = false;
boolean tupacButton = false;





//**************************
// SETUP 
//************************** 

void setup () {

size(512,714);      
font = loadFont("MyriadPro-Bold-24.vlw");  

jayZpic = loadImage("jayZ.jpg");
biggiePic = loadImage("biggie.jpg");
tupacPic = loadImage("tupac.jpg");
fiftyCent = loadImage ("50cent.jpg");

image(jayZpic, 0, 0, imgW, imgH);
image(biggiePic, 0, imgH, imgW, imgH);
image(tupacPic, 0, imgH*2, imgW, imgH);



for ( int i = 0; i< imgMaster.length; i++ )
    {
    imgMaster[i] = loadImage( i + ".jpg" );  
    imgMaster[i].resize(imgW,imgH); 
    }
 intro();
 
}//end setup

//**************************
// DRAW
//************************** 

void draw () {



//println("drawdraw");
    
}//end Draw

//**************************
// Screen States
//************************** 
 //intro screen
 void intro ()
{
 
background(0);  
image(jayZpic, 0, 0, imgW, imgH);
image(biggiePic, 0, imgH, imgW, imgH);
image(tupacPic, 0, imgH*2, imgW, imgH);

  //text on home screen
  textFont(font); // myriad font
  textSize(40);
  fill(250);  
  textAlign(CENTER);
  text("Select your Rapper", 10, (imgH*3)- 55, width-10, imgH*3);

  textFont(font);
  textSize(12);
  fill(250);  
  textAlign(LEFT);
  text("Press ENTER to return to main screen", 10, (imgH*3)- 14, width-10, imgH*3);
  
  textFont(font);
  textSize(12);
  fill(250);  
  textAlign(RIGHT);
  text("Tweet funnies @dockhands #dogsbrunch", 10, (imgH*3)- 14, width-20, imgH*3);

  textFont(font);
  textSize(12);
  fill(250);  
  textAlign(RIGHT);
  text("Press 1 for JayZ", 10, 10, width-15, imgH*3);
  
  textFont(font);
  textSize(12);
  fill(0);  
  textAlign(RIGHT);
  text("Press 2 for Biggie", 10, imgH+10, width-15, imgH*3);
  
  textFont(font);
  textSize(12);
  fill(250);  
  textAlign(RIGHT);
  text("Press 3 for Tupac", 10, imgH*2+10, width-15, imgH*3);


//} 
} // end intro

//**************************
// USER INPUT : KeyBoard
//**************************   
// if (key == CODED) {


void keyPressed () {  
   if (keyCode == '1') {
     jayz();
   }
   
 if (keyCode == '2') {
     biggie();
   }

  if (keyCode == '3') {
     tupac();
   }
   
if (keyCode == '4') {
     fiftyCent();
   }


if (keyCode == ENTER) {
    intro();
   }


}
 


//**************************
// JayZ

void jayz () {
    
    callImages ();

    int randStanza = int(random(0,14)); 
       
    text(jayzLyrics[randStanza ][0], 10, (imgH)-55, width-10, (imgH));
    text(jayzLyrics[randStanza ][1],10, (imgH*2)-55, width-10, (imgH*2));
    text(jayzLyrics[randStanza ][2], 10, (imgH*3)-55, width-10, (imgH*3)); 
   
    //saveFrame();
   // noLoop ();
}//jayZ function

//**************************
// Biggie 
void biggie () {
   // frameRate(speed);
   // pause();
    callImages ();
    int randStanza = int(random(0,14)); 
      
    text(biggieLyrics[randStanza ][0], 10, (imgH)-55, width-10, (imgH));
    text(biggieLyrics[randStanza ][1],10, (imgH*2)-55, width-10, (imgH*2));
    text(biggieLyrics[randStanza ][2], 10, (imgH*3)-55, width-10, (imgH*3)); 
    
   // saveFrame();
    
    //noLoop();
}//biggie function


//**************************
// Tupac

void tupac () {
   // frameRate(speed);
    //pause();
    callImages ();
    int randStanza = int(random(0,14)); 
          
    text(tupacLyrics[randStanza ][0], 10, (imgH)-55, width-10, (imgH));
    text(tupacLyrics[randStanza ][1],10, (imgH*2)-55, width-10, (imgH*2));
    text(tupacLyrics[randStanza ][2], 10, (imgH*3)-55, width-10, (imgH*3)); 
    
   // saveFrame();
   // noLoop();
    
}//tupac function



//**************************
// 50cent

void fiftyCent () {
    
   // background (0); 
   image((fiftyCent), 0,0);
    

   textFont(font);
  textSize(48);
  fill(250);  
  textAlign(CENTER);
  text("The fucks going on? Ain't nobody telling you to Press 4", 50, imgH+100, width-80, imgH*3);
   
   
}//50cent end



//**************************
// get Images
void callImages ()  { // used to pick random images and text style
  
   int rand10 = int(random(1,10)); // pick random number 
   int rand20 = int(random(10,20));
   int rand30 = int(random(20,30)); 
   
    println(imgMaster[rand10]);  // print image name
    println(imgMaster[rand20]);
    println(imgMaster[rand30]);
 
    image(imgMaster[rand10],0,0); // pick random image based on random number
    imgMaster[rand10].resize(imgW,imgH); 
    image(imgMaster[rand20],0,imgH); 
    imgMaster[rand20].resize(imgW,imgH); 
    image(imgMaster[rand30],0,imgH*2); 
     imgMaster[rand30].resize(imgW,imgH); 
   
   // textSize(21);  // text size
    textFont(font, 24); //font
    fill(250);    // white text 
    textAlign(CENTER); // center Text
} 


//**************************
// TEXT
//**************************   


String [][] jayzLyrics = {

 {"Back when Police was Al'Qaeda to black men",
"While I was out there hustling sinning with no religion",
"He was off the wall killing for a living"
  },

{"Rap harder like I'm part of a cult",
"Like Cuban cigar maker 'cept I'm hard to smoke",
"And y'all choke motherfuckers"
 },

{"Friend or Foe, y'all all my muh' fuckers",
"If you haven't heard, I'm Michael Magic and Bird",
"all rolled in one - cause none got more flows than Young"
 },
 

{"I used to cut up they buddies,",
"now they sayin they love me",
"Used to tell they friends I was ugly and wouldn't touch me"
 },


{"Down to ride 'til the very end, it's me and my boyfriend.",
"All I need in this life of sin, is me and my girlfriend.",
"Down to ride 'til the very end, it's me and my boyfriend."
 },

{"Don't give him no info, he'll be lost without it",
"Just keep your mouth shut, we could do this again",
"Bring a friend!"
 },

{"This nigga Un yo I scratched him, he went home without an aspirin",
"But it's cool cause he's back friends, and half-inning is over",
"It's in the past and I'm glad, now I'm back to being Hova"
 },

{"And I 'gon tell you again let's get ghost in the phantom",
"You could bring your friend we could make this a tandem",
"You could come by yourself and you could stand him"
 },

{"I put friends over business end of the day though",
"But when friends, business interests as they go",
"Ain't nothing left to say though I guess we forgot what we came fo'"
 },

{"To Lil Kim and them, you know the women friend",
"Who, carry the work cross state for a gentlemen",
"Yeah, thanks to all the hustlers And most importantly you, the customer"
 },

{"Til' then, I'm just gonna fly in the Benz",
"Wire my friends through Western Union. Shh....surprising my sister, knockin'",
"Here comes the bad guy again!"
 },

{"Worst enemies want to be my best friends",
"Best friends want to be enemies, like that's what's in",
"But I don't give a fuck, walk inside the lion's den",
 },

{"My best friends gone, I seen bad days",
"Still find songs that I hear him on",
"Getting my Mary J. Blige Reminisce on, I hear his voice in my mind, like, nigga live on"
 },


{"...Got so many different Monicas, but only one Jay",
"They come, they go. Some real, some faux",
"Some friends, some hoes.... But no I, goes nowhere, it's Hov"
 }

};


String [][] tupacLyrics = {

 {"I'm 'Losin My Religion', I'm vicious on these stool pigeons", 
 "You might be deep in this game, but you got the rules missin, Niggaz be actin like they savage,",
  "They out to get the cabbage, I got, nuthin but love, for my niggaz livin lavish"
  },

{"Scandalous times, this game's like my religion",
 "You could be rollin with a thug",
  "Instead you with this weak scrub, lookin for some love"
 },

{"I got no love for these niggaz, there's no need to be friends",
"They got me under surveillance, that's what somebody be tellin",
"Know there's dope bein sold, but +I+ ain't the one sellin!"
},

 {"Open and shut like doors",
"is you a friend or foe ? nigga you ain't know ?",
"they got me stressed out on Death Row"
 },

{"Baby we can be friends, I can soup you in my Benz",
"we'll ride, I'll let you floss it for your friends",
"Once we begin until the end, it gets better with time. I'm makin' love to your mind baby"
 },


{"What was a friend now a ghost in the dark, cold hearted about it",
"Nigga got smoked by a fiend, trying to floss on him",
"Blind to a broken man's dream, a hard lesson",
 },

{"Don't give him no info, he'll be lost without it",
"Just keep your mouth shut, we could do this again",
"Bring a friend!"
 },

{"Switch sides, guess his new friends wanted him dead",
"Probably be murdered for the shit that I said",
"I bring the real, be a legend, breathin the dead"
 },

{"All I ever did, was try to reach the kids with the real",
"All the time I was ballin, never heard my friends callin",
"Couldn't stop myself from fallin, I'm all in"
 },

{"My fake friends say they love me but I know they lie",
"cause in the dark see they hearts' full of homicide",
"My mama cried when they took me off to jail"
 },

{"Money gone fuck friends, I need a homie that know me",
"when all these muthafuckin' cops be on me, I got problems ain't nobody calling back",
"now what the fuck is happenin' with my ballin' cats"
 },

{"Look around and all I see is snakes and faces, like scavengers waitin' to take a hustler's pape's",
"and when you stuck where the fuck is all ya friends",
"They straight busted and can't be trusted fuck y'all"
 },

{"These motherfuckers tryin to dirty up my name,",
"but I'm slippin quick as the wind, it's me or them",
 "Fuck friends my foes be on a mission tryin to do me in"
 },

{"Remember that little, bird, he snitched and told a, friend",
 "It's trouble on my mind, I'm with the old timers",
"And fuck five-oh, blaow blaow.. turn em into forty-niners"
 },


{"I thought I had friends but in the end a nigga dies lonely",
"Nowhere to run I'm in terror, and no one cares",
"A closed casket at my funeral and no one's there",
 }

};


String [][] biggieLyrics = {
  
{"Yo Big this is Quita, Kenya told me she saw you and Shana in the mall",
"and I know you aint fuckin' her. You fucked with me last night that's my",
"best friend and we don't get down like that."
},

{"I guess the niggaz felt they had to kill the closest one to me (uh, yeah)",
"And when I find em your life is to and end",
"They killed my best friend... me and my bitch"
},

{
"No need to be greedy I got mad friends with Benz's",
"C-notes by the layers, true fuckin players, Jump in the Rover and come over",
"tell your friends jump in the GS3, I got the chronic by the tree"
},

{
"(How ya livin Biggie Smalls?) In mansion and Benz's ",
"Givin ends to my friends and it feels stupendous", 
"Tremendous cream, fuck a dollar and a dream. Still tote gats strapped with infrared beams"
},

{
"I had to find the buried treasure, so grams I had to measure",
"However living better now, Coogi sweater now",
"Drop top BM's, I'm the man girlfriend"
},

{
"Tell your friends, to get with my friends",
"And we can be friends",
"Shit we can do this every weekend"
},

{
"Thug nigga 'til the end, tell a friend bitch",
"'cause when I like ya, then ya go and fuck my friend bitch",
"(And you know that ain't right)"
},

{
"What about the fight in the Mirage?",
"I seen ya Benz, parked outside my sister's garage",
"Said it was ya friend Rog, bullshit"
},

{
"Cryin, know my friends is lyin",
"Y'all know who killed im filled im with the lugars from they Rugers",
"or they Desert, dyin ain't the shit but it's present"
},

{
"Hug from fake friends, Make ends they hate you, be broke girls won't date you",
"That's why I relate to, choke your ass 'til your face blue, make you",
"Open the safe too"
},
{
"Be in spots where they were no bitches, you feel me",
"Reminisce on dead friends too",
"You're nobody 'til somebody kills you"
},

{
"Hops, out the truck like, 'Trick, what up?' ",
"Call me Sean if you suck, call me gone when I nut",
"That's the end of us, get your friend to fuck"
},
{
"Strongest of calibers, is what we only travel wit",
"You gotta get hit, your man did, so you got a hand in it",
"Extort y'all, once friends, now we gotta cross y'all"
},
{
"Tuesday I saw you on the zee, but you still wanna get wit me",
"Wednesday is the Benz day",
"that's what your friends say"
},
{
"If you want I'm a veteran when I show up to the club it's VIP",
"I'll be dancin in the club if it's B.I.G",
"I'm not lookin' to find a wife - just someone to make a friend of mine",
}
};




