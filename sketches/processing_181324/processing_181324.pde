
//import audio library
import ddf.minim.*;

//creating variables for images and audio and text
Minim minim;
AudioSample a1;
AudioSample a2;
AudioSample a3;
AudioSample a4;
AudioSample a5;
AudioSample a6;
AudioSample a7;
PImage picture;
PImage colorful;

String[] sentences = {
    "I used to be outspoken\ndoin' anything for someones attention\nand when that changed I guess you thought\nthat I was no longer me\nalthough I finally found me\nso take the other bodies\nand put them by the TV\nyou make real friends quickly\nbut not me\nyouth lagoon",
    "I want you to be free\nbut I don't wanna share\nno I don't wanna let ya go\nbut it's about time I do\nI can't blame ya anymore\nand I still love you\ndevendra banhart",
  "ainda bem que eu não desisto\ndessa vida louca\ntive vontade sim de\ndar um tiro na cabeça\ncilibrinas do éden",
  "a gentle love\na gentle heart\nall things that cause you joy cause pain\nsnapper",
  "quase sempre, para viver em paz com nosso próprio eu, fantasiamos de cálculos e sistemas a nossa incapacidade e fraqueza: é quanto basta para satisfazer aquela porção nossa que é, por assim dizer, espectadora da outra.\nbenjamin constant",
  "I think at the age of 16 or 17 we are almost nothing, I really do think that. we don't think that, but if you look back on yourself—god! myself at 17 was this callow, callow person. what you become 10 years or 20 years later or more is so much more complicated and good and bad and all these things. so for people to make decisions at that age or people who are judged at that age, it's a terrible thing to happen to them, I think.\nmichael ondaatje",
  "art has no place in modern life. it will continue to exist as long as there is a mania for the romantic and as long as there are people who love beautiful lies and deception.\naleksandr rodchenko",
  "sentia vontade de tirar das coisas uma espécie de proveito próprio e repelir como inútil tudo aquilo que não contribuísse para a alegria imediata do coração, pois tinha um temperamento mais sentimental que artístico, procurando emoções e não paisagens\ngustave flaubert",
  "rien n’absorbe plus que l’amour. on n’est pas paresseux, parce que, étant amoureux, on paresse. l’amour sent confusément que son seul dérivatif réel est le travail. aussi le considère-t-il comme un rival. et il n’en supporte aucun. mais l’amour est paresse bienfaisante, comme la molle pluie qui féconde.\nraymond radiguet",
  "I wonder if it's possible to have a love affair that lasts forever.\nandy warhol",
  "in the darkness passing through\ntell me is it really you?\nyou don't look the same as when I was dreaming\neven though it's not much time\nI can't get it off my mind\neverything feels different now here without you\nout in the way\nit was in you that I could work around\nbeach fossils",
  "what direction should we choose we’re lost and still confused I walk into the sun with you the only one who understood the ways the hours became days the weeks turn into months we walk into the sun so glad to have a guide less lonely for the ride and should this car ascend at least I’m with a friend in space all things are slow no sound with speakers blown the silence fits the scene the prince is now the king we walk into the sun we walk but cannot run because walking's half the fun we walk into the sun neon blurs my sight I’m guided by strange lights I’m rattled and I’m stunned we walk into the sun\ndeerhunter",
  "only fear\ncan make you feel lonely out here\nyou learn to accept\nwhatever you can get\ndeerhunter",
  "tomorrow will be just the same\na different room a different name\nyou've told yourself you'd be alright\nin the funeral of the nightlife\fa threaded needle is love\nfor ones as lost as us\nlotus plaza",
  "this criminal walked into my room he asked me why do you live this way? think of all you could have, what I would take\nwell, have you got a clue? why do you live this way? why do you? think of all I'd take\nyou think that I don't know\nyou're wrong\natlas sound",
  "wild heart, surrender to me\nwhat does it take to be like you?\nwild nothing",
  "because our lips won't last forever\nand that's exactly why\nI'd rather live in dreams and I'd rather die\nwe've got eyes on the back of our heads\nwild nothing",
  "I seem sadder than before\nit's not cause I miss you not at all \nI'm a liar\nI seem sadder than before\nbut you're not that far away from home\nwe shouldn't be wasting time \nspend it now\ntwin cabins",
  "black and white red or blue\nnever clear which\nmeans I love you\ntwin cabins",
  "y van a sonar las canciones, de las que me ponen triste\nlabios motores, besan se van, cuento al revés, ya no sé amar\ncancioneira",
  "vite\nécris-moi les mots qui m'aiment\nj'ai perdu mon doigt qui saigne\nmelody prochet",
  "si supieras\nque un día serás de verdad\ny habrá quien me quiera\neduardo mateo",
  "quiero volar quiero ascender nunca volver a llorar\nlo he de lograr voy a encontrar la libertad de ser\nvivir es sonar\nadanowsky",
  "it can't be gone, we're still right here\nit took so long, can't say we felt it all\nlimbs parallel, we stood so long we fell\nove's like a pantheon, it carries on forever\nbeach house",
  "we often tend to try too much to get the best out of something, and I think there is something fresh and sincere about keeping that first thought. I try to learn from each thing and implement that new knowledge into the next one.\nana kras", 
  "I don't understand half the stuff I create. I don't have to explain it. I don't have to explain myself or my motivations.\nbradford cox", 
  "the private property aspect of creativity must be destroyed. all are creators and there is no reason of any sort for this division into artist and nonartist.\nel lissitzky", 
  "when I think about her past, I think about space and how both of them make no sense to me. they are both so big, and I have never slept in a house that large. \ngregory sherl", 
  "I won’t set my sights on other seas, there is no need to panic.\nalvvays", 
  "there is no reality except the one contained within us. that is why so many people live such an unreal life. they take the images outside of them for reality and never allow the world within to assert itself. \nhermann hesse", 
  "you are willing to die, you coward, but not to live. \nhermann hesse", 
  "honey\n dip your toes in sand, dreams they often seep\nlovely\nmake me promises you know you couldn't keep.\ntwin cabins", 
  "when you are the only \npassenger if there is a \nplace further from me \nI beg you do not go. \nfrank o’hara", 
  "I don't wanna stay at your party \nI don't wanna talk with your friends \nI don't wanna vote for your president \nI just wanna be your tugboat captain \ngalaxie 500", 
  "the quiet hours fall to pieces \nheaven isn't where I thought \nthe dream is dying, fading fast now \nthe quiet hours gone at last \nwild nothing", 
  "talking shit about a pretty sunset \n blanketing opinions that I'll probably regret soon \nI've changed my mind so much I can't even trust it \n my mind changed me so much I can't even trust myself \nmodest mouse", 
  "love is a form of prejudice. I have too many other prejudices. \ncharles bukowski", 
  "tourmenté d'une émotion vague, je veux être aimé, me disais-je, et je regardais autour de moi; je ne voyais personne qui m'inspirât de l'amour, personne qui me parût susceptible d'en prendre; j'interrogeais mon coeur et mes goûts: je ne me sentais aucun mouvement de préférence. \nbenjamin constant", 
  "os grandes homens… não foram fanfarrões ou bufões, mas pessoas sensíveis ao terror da vida e se prepararam para enfrentá-lo.\ncharles baudelaire", 
  "in the artwork, subject matter is a ballast jettisoned by contemplation.\nwalter benjamin",
  "break my life in two, I don't care enough\nelsa"
};
void setup () {
  //loading the audio files, the font I chose
  minim = new Minim(this);
  a1 = minim.loadSample("a1.mp3");
  a2 = minim.loadSample("a2.mp3");
  a3 = minim.loadSample("a3.mp3");
  a4 = minim.loadSample("a4.mp3");
  a5 = minim.loadSample("a5.mp3");
  a6 = minim.loadSample("a6.mp3");
  a7 = minim.loadSample("a7.mp3");
  PFont pixel = loadFont("pixeltype.vlw");
  textFont(pixel);
  size(1050, 720);
  background(loadImage("oi.png"));
  textSize(20);
  noStroke();
  fill(255);
  text("PICK A COLOR", 20, 560, 140, 120);
}
void draw() {
  textSize(36);
//every time processing goes through the draw code block, if the mouse is pressed, the background is reloaded
//this is useful because if not, the images would be summed upon and the layering would be incorrect
  if (mousePressed == true) {

    background(loadImage("oi.png"));

    textSize(18);
    //each if block is a color bar, because it sets what happens according to where the mouse is pressed
    //note that things happen only if the mouse is pressed
    if ((mouseX>0) && (mouseX<150) && (mouseY<540)) {
      //an audio file sounds
      a1.trigger();
      //this makes a white rectangle for the picture to be upon, like a canvas
      fill(255);
      rect(540, 0, 510, 540);
      fill(0);
      //here a random sentence from the 41 above is chosen and shown on the right side
      text(sentences[int(random(41))], 560, 20, 470, 500);
      float location = random(1, 123.5);
      int imglocation = int(location);
      //each picture in this sketch is numbered from 1 to 123, here the photo is loaded as imglocation which is the random number
      picture = loadImage(imglocation + ".jpg");
      //the colors are also images, but they are set according to the previous color bar clicked so they are not random
      colorful = loadImage("cor1.jpg");
      image(picture, 0, 0, 540, 540);
      //this blends the color jpg and the photo jpg
      blend(colorful, 0, 0, 540, 540, 0, 0, 540, 540, SCREEN);
      fill(255);
      textSize(20);
      //after clicking, a text tells you what to do next
      text("CLICK HERE THEN TRY AGAIN", 380, 560, 500, 120);
    }
    if ((mouseX>150) && (mouseX<300) && (mouseY<540)) {
      a2.trigger();
      fill(255);
      rect(540, 0, 510, 540);
      fill(0);
      text(sentences[int(random(41))], 560, 20, 470, 500);
      float location = random(1, 123.5);
      int imglocation = int(location);
      picture = loadImage(imglocation + ".jpg");
      colorful = loadImage("cor2.jpg");
      image(picture, 0, 0, 540, 540);
      blend(colorful, 0, 0, 540, 540, 0, 0, 540, 540, SCREEN);
      fill(255);
      textSize(20);
      text("CLICK HERE THEN TRY AGAIN", 380, 560, 500, 120);
    }
    if ((mouseX>300) && (mouseX<450) && (mouseY<540)) {
      a3.trigger();
      fill(255);
      rect(540, 0, 510, 540);
      fill(0);
      text(sentences[int(random(41))], 560, 20, 470, 500);
      float location = random(1, 123.5);
      int imglocation = int(location);
      picture = loadImage(imglocation + ".jpg");
      colorful = loadImage("cor3.jpg");
      image(picture, 0, 0, 540, 540);
      blend(colorful, 0, 0, 540, 540, 0, 0, 540, 540, SCREEN);
      fill(255);
      textSize(20);
      text("CLICK HERE THEN TRY AGAIN", 380, 560, 500, 120);
    }
    if ((mouseX>450) && (mouseX<600) && (mouseY<540)) {
      a4.trigger();
      fill(255);
      rect(540, 0, 510, 540);
      fill(0);
      text(sentences[int(random(41))], 560, 20, 470, 500);
      float location = random(1, 123.5);
      int imglocation = int(location);
      picture = loadImage(imglocation + ".jpg");
      colorful = loadImage("cor4.jpg");
      image(picture, 0, 0, 540, 540);
      blend(colorful, 0, 0, 540, 540, 0, 0, 540, 540, SCREEN);
      fill(255);
      textSize(20);
      text("CLICK HERE THEN TRY AGAIN", 380, 560, 500, 120);
    }
    if ((mouseX>600) && (mouseX<750) && (mouseY<540)) {
      a5.trigger();
      fill(255);
      rect(540, 0, 510, 540);
      fill(0);
      text(sentences[int(random(41))], 560, 20, 470, 500);
      float location = random(1, 123.5);
      int imglocation = int(location);
      picture = loadImage(imglocation + ".jpg");
      colorful = loadImage("cor5.jpg");
      image(picture, 0, 0, 540, 540);
      blend(colorful, 0, 0, 540, 540, 0, 0, 540, 540, SCREEN);
      fill(255);
      textSize(20);
      text("CLICK HERE THEN TRY AGAIN", 380, 560, 500, 120);
    }
    if ((mouseX>750) && (mouseX<900) && (mouseY<540)) {
      a6.trigger();
      fill(255);
      rect(540, 0, 510, 540);
      fill(0);
      text(sentences[int(random(41))], 560, 20, 470, 500);
      float location = random(1, 123.5);
      int imglocation = int(location);
      picture = loadImage(imglocation + ".jpg");
      colorful = loadImage("cor6.jpg");
      image(picture, 0, 0, 540, 540);
      blend(colorful, 0, 0, 540, 540, 0, 0, 540, 540, SCREEN);     
      fill(255);
      textSize(20);
      text("CLICK HERE THEN TRY AGAIN", 380, 560, 500, 120);
    }
    if ((mouseX>900) && (mouseX<1050) && (mouseY<540)) {
      a7.trigger();
      fill(255);
      rect(540, 0, 510, 540);
      fill(0);
      text(sentences[int(random(41))], 560, 20, 470, 500);
      float location = random(1, 123.5);
      int imglocation = int(location);
      picture = loadImage(imglocation + ".jpg");
      colorful = loadImage("cor7.jpg");
      image(picture, 0, 0, 540, 540);
      blend(colorful, 0, 0, 540, 540, 0, 0, 540, 540, SCREEN);
      fill(255);
      textSize(20);
      text("CLICK HERE THEN TRY AGAIN", 380, 560, 500, 120);
    }
  }
}


