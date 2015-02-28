

void setup() {
 size(700,700);
 background(255);
}

String[] quotes = { 
"'Today you are You, that is truer than true. There is no one alive who is Youer than You'",
"'Don't cry because it's over. Smile because it happened.'",
"'Why fit in when you were born to stand out?' ~Dr. Seuss",
"'Today was good. Today was fun. Tomorrow is another one.'",
"'You'll miss the best things if you keep your eyes shut.'",
"'Think and wonder, wonder and think.'",
"'Today is your day! Your mountain is waiting, So...get on your way.'",
"'Unless!'",
"'THINK! You can think any THINK that you wish...'",
"'If you never did, you should. These things are fun and fun is good.'",
"'You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.'",
"'You are you. Now isn't that pleasant?'",
"'Sometimes the questions are complicated and the answers are simple.'",
"'It is better to know how to learn than to know.'",
"'Everything stinks till it's finished'",
"'The more that you read, the more things you will know. The more that you learn, the more places you'll go.'",
"'A person's a person, no matter how small'",
"'I meant what I said and I said what I meant'",
"'Only you can control your future.'",
"'Be awesome! Be a book nut!'",
"'Be who you are and say what you mean. Because those who mind don't matter and those who matter don't mind'",
"'Oh, the things you can find if you don't stay behind!'",
"'It's opener, out there, in the wide, open air.'",
"'Teeth are always in style.'",
"'Today I shall behave, as if this is the day I will be remembered'",
"'Will you succeed? Yes you will indeed! Ninety-eight and three-quarters percent guaranteed.'",
"'From there to here, and here to there, funny things are everywhere.'",
"'Step with care and great tact. And remember that Life's a Great Balancing Act'",
"'Unless someone like you cares a whole awful lot, nothing is going to get better. It's not.'",
"'You're on your own. And you know what you know. And YOU are the one who'll decide where to go...'"};

int statement = int(random(quotes.length));
float x_position = random(0,400);
float y_position = random(0,400);

void draw() {
 textSize(20);
 fill(255);
 text(quotes[statement], x_position, y_position, 200,300);
 fill(0);
 ellipse(mouseX,mouseY, 50, 50);
}




