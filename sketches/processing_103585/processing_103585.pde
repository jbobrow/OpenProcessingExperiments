
String text = "a You dont have to be French to enjoy a decent red wine z z Charles Jousselin de Gruse used to tell his a foreign guests whenever he entertained them in Paris But you do have to be French to recognize one he would add with a laugh after a lifetime in the French diplomatic corps the Count de Gruse lived with his wife in an elegant townhouse on Quai Voltaire He was a likeable man cultivated of course with a well deserved reputation as a generous host and an amusing raconteur This evenings guests were all European and all equally convinced that immigration was at the root of Europes problems Charles de Gruse said nothing He had always concealed his contempt for such ideas and in any case he had never much cared for these particular guests The first of the red Bordeaux was being served with the veal and one of the guests turned to de Gruse Come on Charles its simple arithmetic Nothing to do with race or colour You mustve had bags of experience of this sort of thing What dyou say Yes General Bags Without another word de Gruse picked up his glass and introduced his bulbous winey nose after a moment he looked up with watery eyes a truly fullbodied Bordeaux he said warmly a wine among wines The four guests held their glasses to the light and studied their bloodred contents They all agreed that it c c was c c the best wine they had ever tasted One by one the little white lights along a the Seine were coming on and from the firstfloor windows you could see a the brightly lit bateauxmouches passing through the arches of the Pont du Carrousel The party moved on to a dish of game served with a more vigorous claret Can you imagine asked de Gruse as the claret was poured that there are people who actually serve wines they know nothing about Really said one of the guests a German politician Personally before i uncork a bottle i like to know whats in it But how How can anyone be sure i like to hunt around the vineyards Take this place i used to visit in Bordeaux i got to know the winegrower there personally Thats the way to know what youre drinking a matter of pedigree Charles said the other politician This fellow continued de Gruse as though the Dutchman had not spoken always gave a you the story behind his wines a One of them was the most extraordinary story i ever heard We were tasting in his winery and we came to a cask that made him frown He asked if i agreed with him that red Bordeaux was the best wine in the world Of course i agreed Then he made the strangest statement The wine in this cask he said and there were tears in his eyes is the best vintage in the world But it started its life far from the country where it was grown De Gruse paused to check that his guests were being served Well said the Dutchman De Gruse and his wife exchanged glances Do tell them mon chéri she said De Gruse leaned forwards took another sip of wine and dabbed his lips with the corner of his napkin This is the story he told them at the age of twentyone Pierre that was the name he gave the winegrower had been sent by his father to spend some time with his uncle in Madagascar Within two weeks he had fallen for a local girl called Faniry or Desire in Malagasy You could not blame him at seventeen she was ravishing in the Malagasy sunlight her skin was golden Her black waistlength hair which hung straight beside her cheeks framed large fathomless eyes it was a genuine coup de foudre for both of them Within five months they were married Faniry had no family but Pierres parents came out from France for the wedding even though they did not strictly approve of it and for three years the young couple lived very happily on the island of Madagascar Then one day a telegram came from France Pierres parents and his only brother had been killed in a car crash Pierre took the next flight home to attend the funeral and manage the vineyard left by his father Faniry followed two weeks later Pierre was griefstricken but with Faniry he settled down to running the vineyard His family and the lazy idyllic days under a z z z z tropical sun were gone forever But he was very happily married and he was very welloff Perhaps he reasoned life in Bordeaux would not be so bad But he was wrong it soon became obvious that Faniry was jealous in Madagascar she had no match in France she was jealous of everyone Of the maids Of the secretary Even of the peasant girls who picked the grapes and giggled at her funny accent She convinced herself that Pierre made love to each of them in turn She started with insinuations simple artless ones that Pierre hardly even recognized a Then she tried blunt accusation in the privacy of their bedroom When he denied that she resorted to violent humiliating denouncements in the kitchens the winery the plantations The angel that Pierre had married in Madagascar had become a termagant blinded by jealousy Nothing he did or said could help Often she would refuse to speak for a week or more and when at last she spoke it would only be to scream yet more abuse or swear again her intention to leave him By the third vineharvest it was obvious to everyone that they loathed each other One Friday evening Pierre was down in the winery working on a new electric winepress He was alone The grapepickers had left Suddenly the door opened and Faniry entered excessively made up She b b b walked straight up d d d to Pierre flung her arms around his neck and pressed herself against him Even above the fumes from the pressed grapes he could smell that she had been drinking Darling she sighed what shall we do He badly wanted her but all the past insults and humiliating scenes welled up inside him He pushed her away But darling im going to have a baby Dont be absurd Go to bed Youre drunk and take that paint off it makes you look like a tart Fanirys face blackened and she threw herself at him with new accusations He had never cared for her He cared only about sex He was obsessed with it and with white women But the women in France the white women they were the tarts and he was welcome to them She snatched a knife from the wall and lunged at him with it She was in tears but it took all his strength to keep the knife from his throat Eventually he pushed her off and she stumbled towards the winepress Pierre stood breathing heavily as the screw of the press caught at her hair and dragged her in She screamed struggling to free herself The screw bit slowly into her shoulder and she screamed again Then she fainted a a a a a a a though whether from the pain or the fumes he was not a sure He looked away until a sickening sound told him it was over Then he raised his arm and switched the current off The guests shuddered visibly and de Gruse paused in his story Well i wont go into the details at table he said Pierre fed the rest of the body into the press and tidied up Then he went up to the house had a bath ate a meal and went to bed The next day he told everyone Faniry had finally left him and gone back to Madagascar Noone was surprised He paused again His guests sat motionless their eyes turned towards him Of course he continued Sixtyfive was a bad year for red Bordeaux Except for Pierres That was the extraordinary thing it won award after award and nobody could understand why The generals wife cleared her throat But surely she said you didnt taste it No i didnt taste it though Pierre did assure me his wife had lent the wine an incomparable aroma and you didnt er buy any asked the general How could i refuse it isnt every day that one finds such a pedigree There was a long silence The Dutchman shifted awkwardly in his seat his glass poised midway between the table and his open lips The other guests looked around uneasily at each other They did not understand But look here Gruse said the general at last you dont mean to tell me were drinking this damned woman now dyou De Gruse gazed impassively at the Englishman Heaven forbid General he said slowly Everyone knows that the best vintage should always come first";
//String foo = text.replaceAll("[\\-\\+\\.\\^:,]", " ");
ArrayList<Dots> dot;
int i = 0,flag = 0,oldx=width/2,oldy=height/20,x=width/2,y=height/2,strop=50;
//println(foo);
 String[] words = split(text, ' ');
 int w=1000,h=300,loaded=1;

void setup(){
    size(w,h);
    //frameRate(20);
    background(#151515);
    dot = new ArrayList<Dots>();
   dot.add(new Dots("",#c1c1c1,width/2,height/2));
  // noStroke();
   smooth();
}
void draw(){
 //   println(words.length);
    Dots p = dot.get(0);
    Dots q = dot.get(0);
  if(i<words.length){
   // println(words[i]);
    for(int j=0;j< dot.size();j++){
    p = dot.get(j);
    //println(p.getText());
    if(p.getText().contains(words[i])){
    flag = 1;
    q = dot.get(j);
    }else{
    flag = 0;
    }
    }
   if(flag == 0){  
   dot.add(new Dots(words[i],int(random(255)),int(random(width-60)),int(random(height-50))));
   
  stroke(100,strop);
   line(oldx,oldy,dot.get(dot.size()-1).getx()+40,dot.get(dot.size()-1).gety()+40);
   dot.get(dot.size()-1).drawDot(0);
   oldx = dot.get(dot.size()-1).getx()+40;
   oldy = dot.get(dot.size()-1).gety()+40;
   }else{
     
  stroke(100,strop);
   line(oldx,oldy,q.getx()+40,q.gety()+40);
   q.drawDot(50);
   oldx = q.getx()+40;
   oldy = q.gety()+40;
   }
  }
  i++;
} 

class Dots{
  int x=width/2,y=height/2,r=20,colour;
  String s="";
   Dots(String word,int col, int px, int py){
      s = word;
      colour = col;
      x = px;
      y = py;
   } 
   String getText(){
     return(s);
   }
   int getx(){
     return(x);
   }
   int gety(){
     return(y);
   }
  void drawDot(int rad){
    //fill(colour,20,random(80),100);
    fill(colour,80,random(80),100);
    r+=rad;
    noStroke();
    ellipse(x+40,y+40,r,r);
    fill(#ffffff,100);
    text(s,x,y);
  }
};
