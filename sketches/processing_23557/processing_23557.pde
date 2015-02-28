
PFont font;
PFont font2;
int[] keyint;
int[] codeint;
int[] decode;
char[] characterize;
String joinedcharstring;
String[] charstring;
String[] keystring = loadStrings("Key.txt");
String[] code = loadStrings("EncodedMessage.txt");

keyint = int(keystring);
codeint = int(code);

decode = new int[codeint.length];
for (int i = 0; i < codeint.length; i++){
decode[i] = (codeint[i] - keyint[i]);
decode[i] = (95+decode[i])%95;
decode[i] = 31+decode[i];

}

characterize = char(decode);
charstring = str(characterize);
joinedcharstring = join(charstring, "");
println(joinedcharstring);
font = loadFont("ArialMT-16.vlw");
font2 = loadFont("ArialMT-48.vlw");
textFont(font,16);
size(500,200);
background(150,120,150);
text(joinedcharstring, 20, 60,475,180);
textFont(font2,24);
text("Daniel's Decryption Program", 20,20);

