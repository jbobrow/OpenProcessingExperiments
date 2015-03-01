
// combinatorial systems (putting things together...)
 
// -- -- -- The Wall
 
String [] firstWords = {
  "Innovation", "The uncola","The road will never be the same","Better by Adobe","Ask about it at work","We know money","Stronger than dirt","I can’t believe I ate the whole thing","Mama mia, thatsa spicy meatball","The relief goes on","Are you in good hands?",
  "You’re in good hands with", "Doesn’t your dog deserve Alpo?" , "Works like a dream" , "Something special in the air" , "Behold the power of cheese","Don’t leave home without it" , "Do more" , "My life. My card" , "Don’t leave home, without it" , 
  "For fast, fast, fast relief" , "Legendary reliability" , "Think different" , "The power to be your best" , "Think outside the box" , "Reach out and touch someone" , "The world’s networking company" , "Never follow" , "We try harder" , "Higher standards" , 
  "Bank of Opportunity" , "Change we need" , "Thank you for your support" , "Bayer works wonders" , "Flick my Bic" , "We mean clean" , "Life’s messy Clean it up!" , "Sheer driving pleasure" , "The ultimate driving machine" , "Better sound through research" , 
  "The quicker picker-upper" , "When you’ve got it, flaunt it" , "Fill it to the rim with Brim" , "Hope, triumph, and the miracle of medicine" , "The way to fly" , "The world’s favorite airline" ,  "We’re getting there" , "Wassup?!" , 
  "The king of beers" , "It just tastes better" , "Have it your way" , "Break through" , "Calgon, take me away" , "A can a week, that’s all we ask" , "Got milk?" , "Between love and madness lies obsession" ,
  "Nothing comes between me and my Calvins" , "I’d walk a mile for a camel" , "For negative people" , "What’s in your wallet?" , "For virtually spotless dishes" , "Please don’t squeeze the Charmin" , 
  "Anyway you please it, cheese it" , "Get your own box" , "A silly millimeter longer" , "Turning partnership into energy" , "Like a rock" , "Fresh Mex" , "It’s not nice to fool Mother Nature" , 
  "Inspiration comes standard" , "Will you be ready?" , "Empowering the Internet generation" , "Live richly" , "City never sleeps" , "There at every turn" , "If I’ve only one life, let me live it as a blonde",
"Does she or doesn’t she?", "The antidote for civilization", "The source for computing and technology", "The most trusted name in news", "Coca-Cola refreshes you best", "The pause that refreshes", 
"Have a coke and smile", "The silver bullet", "Cotton The fabric of our lives", "If you want to capture someone’s attention, whisper", "Easy, breezy, beautiful Covergirl", "Healthy, beautiful smiles for life",
"Look, Ma, no cavities!", "Cooks who know trust Crisco", "Love it for life", "A diamond is forever", "Easy as Dell", "You’ll love the way we fly", "We love to fly and it shows", "We’re cooking now",
"Restoring the joy of motion", "We move the world", "Yellow. The new Brown", " Competition. Bad for them. Great for you", "Aren’t you glad you use Dial? Don’t you wish everybody did?", "The happiest place on earth",
"Time to make the doughnuts", "The miracles of science", "Better living through chemistry", "Better things for better living, through chemistry", "The power of all of us", "The world’s online marketplace",
"When EF Hutton talks, people listen",
};
 
String [] secondWords = {
  "Innovation", "The uncola","The road will never be the same","Better by Adobe","Ask about it at work","We know money","Stronger than dirt","I can’t believe I ate the whole thing","Mama mia, thatsa spicy meatball","The relief goes on","Are you in good hands?",
  "You’re in good hands with", "Doesn’t your dog deserve Alpo?" , "Works like a dream" , "Something special in the air" , "Behold the power of cheese","Don’t leave home without it" , "Do more" , "My life. My card" , "Don’t leave home, without it" , 
  "For fast, fast, fast relief" , "Legendary reliability" , "Think different" , "The power to be your best" , "Think outside the box" , "Reach out and touch someone" , "The world’s networking company" , "Never follow" , "We try harder" , "Higher standards" , 
  "Bank of Opportunity" , "Change we need" , "Thank you for your support" , "Bayer works wonders" , "Flick my Bic" , "We mean clean" , "Life’s messy Clean it up!" , "Sheer driving pleasure" , "The ultimate driving machine" , "Better sound through research" , 
  "The quicker picker-upper" , "When you’ve got it, flaunt it" , "Fill it to the rim with Brim" , "Hope, triumph, and the miracle of medicine" , "The way to fly" , "The world’s favorite airline" ,  "We’re getting there" , "Wassup?!" , 
  "The king of beers" , "It just tastes better" , "Have it your way" , "Break through" , "Calgon, take me away" , "A can a week, that’s all we ask" , "Got milk?" , "Between love and madness lies obsession" ,
  "Nothing comes between me and my Calvins" , "I’d walk a mile for a camel" , "For negative people" , "What’s in your wallet?" , "For virtually spotless dishes" , "Please don’t squeeze the Charmin" , 
  "Anyway you please it, cheese it" , "Get your own box" , "A silly millimeter longer" , "Turning partnership into energy" , "Like a rock" , "Fresh Mex" , "It’s not nice to fool Mother Nature" , 
  "Inspiration comes standard" , "Will you be ready?" , "Empowering the Internet generation" , "Live richly" , "City never sleeps" , "There at every turn" , "If I’ve only one life, let me live it as a blonde",
"Does she or doesn’t she?", "The antidote for civilization", "The source for computing and technology", "The most trusted name in news", "Coca-Cola refreshes you best", "The pause that refreshes", 
"Have a coke and smile", "The silver bullet", "Cotton The fabric of our lives", "If you want to capture someone’s attention, whisper", "Easy, breezy, beautiful Covergirl", "Healthy, beautiful smiles for life",
"Look, Ma, no cavities!", "Cooks who know trust Crisco", "Love it for life", "A diamond is forever", "Easy as Dell", "You’ll love the way we fly", "We love to fly and it shows", "We’re cooking now",
"Restoring the joy of motion", "We move the world", "Yellow. The new Brown", " Competition. Bad for them. Great for you", "Aren’t you glad you use Dial? Don’t you wish everybody did?", "The happiest place on earth",
"Time to make the doughnuts", "The miracles of science", "Better living through chemistry", "Better things for better living, through chemistry", "The power of all of us", "The world’s online marketplace",
"When EF Hutton talks, people listen",
};
 
String [] thirdWords = {
    "Innovation", "The uncola","The road will never be the same","Better by Adobe","Ask about it at work","We know money","Stronger than dirt","I can’t believe I ate the whole thing","Mama mia, thatsa spicy meatball","The relief goes on","Are you in good hands?",
  "You’re in good hands with", "Doesn’t your dog deserve Alpo?" , "Works like a dream" , "Something special in the air" , "Behold the power of cheese","Don’t leave home without it" , "Do more" , "My life. My card" , "Don’t leave home, without it" , 
  "For fast, fast, fast relief" , "Legendary reliability" , "Think different" , "The power to be your best" , "Think outside the box" , "Reach out and touch someone" , "The world’s networking company" , "Never follow" , "We try harder" , "Higher standards" , 
  "Bank of Opportunity" , "Change we need" , "Thank you for your support" , "Bayer works wonders" , "Flick my Bic" , "We mean clean" , "Life’s messy Clean it up!" , "Sheer driving pleasure" , "The ultimate driving machine" , "Better sound through research" , 
  "The quicker picker-upper" , "When you’ve got it, flaunt it" , "Fill it to the rim with Brim" , "Hope, triumph, and the miracle of medicine" , "The way to fly" , "The world’s favorite airline" ,  "We’re getting there" , "Wassup?!" , 
  "The king of beers" , "It just tastes better" , "Have it your way" , "Break through" , "Calgon, take me away" , "A can a week, that’s all we ask" , "Got milk?" , "Between love and madness lies obsession" ,
  "Nothing comes between me and my Calvins" , "I’d walk a mile for a camel" , "For negative people" , "What’s in your wallet?" , "For virtually spotless dishes" , "Please don’t squeeze the Charmin" , 
  "Anyway you please it, cheese it" , "Get your own box" , "A silly millimeter longer" , "Turning partnership into energy" , "Like a rock" , "Fresh Mex" , "It’s not nice to fool Mother Nature" , 
  "Inspiration comes standard" , "Will you be ready?" , "Empowering the Internet generation" , "Live richly" , "City never sleeps" , "There at every turn" , "If I’ve only one life, let me live it as a blonde",
"Does she or doesn’t she?", "The antidote for civilization", "The source for computing and technology", "The most trusted name in news", "Coca-Cola refreshes you best", "The pause that refreshes", 
"Have a coke and smile", "The silver bullet", "Cotton The fabric of our lives", "If you want to capture someone’s attention, whisper", "Easy, breezy, beautiful Covergirl", "Healthy, beautiful smiles for life",
"Look, Ma, no cavities!", "Cooks who know trust Crisco", "Love it for life", "A diamond is forever", "Easy as Dell", "You’ll love the way we fly", "We love to fly and it shows", "We’re cooking now",
"Restoring the joy of motion", "We move the world", "Yellow. The new Brown", " Competition. Bad for them. Great for you", "Aren’t you glad you use Dial? Don’t you wish everybody did?", "The happiest place on earth",
"Time to make the doughnuts", "The miracles of science", "Better living through chemistry", "Better things for better living, through chemistry", "The power of all of us", "The world’s online marketplace",
"When EF Hutton talks, people listen",
};
   
//String [] fourthWords = {
  // "Innovation", "The uncola","The road will never be the same","Better by Adobe","Ask about it at work","We know money","Stronger than dirt","I can’t believe I ate the whole thing","Mama mia, thatsa spicy meatball","The relief goes on","Are you in good hands?","You’re in good hands with", 
  //"Doesn’t your dog deserve Alpo?" , "Works like a dream" , "Something special in the air" , "Behold the power of cheese","Don’t leave home without it" , "Do more" , "My life. My card" , "Don’t leave home, without it" , "For fast, fast, fast relief" , "Legendary reliability" , "Think different" , "The power to be your best" , "Think outside the box" , "Reach out and touch someone" , "The world’s networking company" , "Never follow" , "We try harder" , "Higher standards" , "Bank of Opportunity" , "Change we need" , "Thank you for your support" , "Bayer works wonders" , "Flick my Bic" , "We mean clean" , "Life’s messy Clean it up!" , "Sheer driving pleasure" , "The ultimate driving machine" , "Better sound through research" , "The quicker picker-upper" , "When you’ve got it, flaunt it" , "Fill it to the rim with Brim" , "Hope, triumph, and the miracle of medicine" , "The way to fly" , "The world’s favorite airline" , "We’re getting there" , "Wassup?!" , "The king of beers" , "It just tastes better" , "Have it your way" , "Break through" , "Calgon, take me away" , "A can a week, that’s all we ask" , "Got milk?" , "Between love and madness lies obsession" ,"Nothing comes between me and my Calvins" , "I’d walk a mile for a camel" , "For negative people" , "What’s in your wallet?" , "For virtually spotless dishes" , "Please don’t squeeze the Charmin" , "Anyway you please it, cheese it" , "Get your own box" , "A silly millimeter longer" , "Turning partnership into energy" , "Like a rock" , "Fresh Mex" , "It’s not nice to fool Mother Nature" , "Inspiration comes standard" , "Will you be ready?" , "Empowering the Internet generation" , "Live richly" , "City never sleeps" , "There at every turn" , "If I’ve only one life, let me live it as a blonde",
//};
   
//String [] fifthWords = {
//  "Innovation", "The uncola","The road will never be the same","Better by Adobe","Ask about it at work","We know money","Stronger than dirt","I can’t believe I ate the whole thing","Mama mia, thatsa spicy meatball","The relief goes on","Are you in good hands?","You’re in good hands with", 
//  "Doesn’t your dog deserve Alpo?" , "Works like a dream" , "Something special in the air" , "Behold the power of cheese","Don’t leave home without it" , "Do more" , "My life. My card" , "Don’t leave home, without it" , "For fast, fast, fast relief" , "Legendary reliability" , "Think different" , "The power to be your best" , "Think outside the box" , "Reach out and touch someone" , "The world’s networking company" , "Never follow" , "We try harder" , "Higher standards" , "Bank of Opportunity" , "Change we need" , "Thank you for your support" , "Bayer works wonders" , "Flick my Bic" , "We mean clean" , "Life’s messy Clean it up!" , "Sheer driving pleasure" , "The ultimate driving machine" , "Better sound through research" , "The quicker picker-upper" , "When you’ve got it, flaunt it" , "Fill it to the rim with Brim" , "Hope, triumph, and the miracle of medicine" , "The way to fly" , "The world’s favorite airline" , "We’re getting there" , "Wassup?!" , "The king of beers" , "It just tastes better" , "Have it your way" , "Break through" , "Calgon, take me away" , "A can a week, that’s all we ask" , "Got milk?" , "Between love and madness lies obsession" ,"Nothing comes between me and my Calvins" , "I’d walk a mile for a camel" , "For negative people" , "What’s in your wallet?" , "For virtually spotless dishes" , "Please don’t squeeze the Charmin" , "Anyway you please it, cheese it" , "Get your own box" , "A silly millimeter longer" , "Turning partnership into energy" , "Like a rock" , "Fresh Mex" , "It’s not nice to fool Mother Nature" , "Inspiration comes standard" , "Will you be ready?" , "Empowering the Internet generation" , "Live richly" , "City never sleeps" , "There at every turn" , "If I’ve only one life, let me live it as a blonde",
//};
 
// String firstword = "this"; // make a String variable, and set its value
// String secondword = "cat"; // make a String variable, and set its value
 
PFont georgia;
 
// -- -- -- Setup
 
 
void setup(){
  size(800,400);
 background(241, 219, 252);
  georgia = createFont("Georgia",24); // font name (looks in font library) and then builds bitmaps based on size 24
  noLoop();
}
 
void draw(){
   
  background(255);
   
  textFont(georgia,24); // use this font and size
  fill(0);
   
  String word1 = firstWords[int(random(firstWords.length))];
  String word2 = secondWords[int(random(secondWords.length))];
  String word3 = thirdWords[int(random(thirdWords.length))];
 // String word4 = fourthWords[int(random(fourthWords.length))];
 // String word5 = fifthWords[int(random(fifthWords.length))];
   
  text(word1,50,100);
  text(word2,50,150);
  text(word3,50,200);
 // text(word4,50,250);
 // text(word5,50,300);
 
  // println(firstWords[int(random(firstWords.length))]);
  // println(secondWords[int(random(secondWords.length))]);
 
 
  String output = firstWords[int(random(firstWords.length))] + " " + secondWords[int(random(secondWords.length))];
  // joining the Strings together (with a space)
 
  println (output);
  // orubt the result
 
}
 
void mouseReleased(){
 redraw();
}


