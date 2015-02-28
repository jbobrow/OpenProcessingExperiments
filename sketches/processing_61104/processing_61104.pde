
import processing.pdf.*;
boolean savePDF = false;

String inputText = "By this time, my dearest sister, you have received my hurried letter; I wish this may be more intelligible, but though not confined for time, my head is so bewildered that I cannot answer for being coherent. Dearest Lizzy, I hardly know what I would write, but I have bad news for you, and it cannot be delayed. Imprudent as a marriage between Mr. Wickham and our poor Lydia would be, we are now anxious to be assured it has taken place, for there is but too much reason to fear they are not gone to Scotland. Colonel Forster came yesterday, having left Brighton the day before, not many hours after the express. Though Lydia's short letter to Mrs.F. gave them to understand that they were going to Gretna Green, something was dropped by Denny expressing his belief that W. never intended to go there, or to marry Lydia at all, which was repeated to Colonel F., who, instantly taking the alarm, set off from B. intending to trace their route. He did trace them easily to Clapham, but no farther; for on entering that place they removed into a hackney-coach and dismissed the chaise that brought them from Epsom. All that is known after this is that they were seen to continue the London road. I know not what to think. After making every possible enquiry on that side London, Colonel F. came on into Hertfordshire, anxiously renewing them at all the turnpikes, and at the inns in Barnet and Hatfield, but without any success; no such people had been seen to pass through. With the kindest concern he came on to Longbourn and broke his apprehensions to us in a manner most creditable to his heart. I am sincerely grieved for him and Mrs. F., but no one can throw any blame on them. Our distress, my dear Lizzy, is very great. My father and mother believe the worst, but I cannot think so ill of him. Many circumstances might make it more eligible for them to be married privately in town than to pursue their first plan; and even if he could form such a design against a young woman of Lydia's connections, which is not likely, can I suppose her so lost to every thing? -- Impossible. I grieve to find, however, that Colonel F. is not disposed to depend upon their marriage; he shook his head when I expressed my hopes, and said he feared W. was not a man to be trusted. My poor mother is really ill and keeps her room. Could she exert herself it would be better, but this is not to be expected; and as to my father, I never in my life saw him so affected. Poor Kitty has anger for having concealed their attachment; but as it was a matter of confidence, one cannot wonder. I am truly glad, dearest Lizzy, that you have been spared something of these distressing scenes; but now, as the first shock is over, shall I own that I long for your return? I am not so selfish, however, as to press for it, if inconvenient. Adieu. I take up my pen again to do what I have just told you I would not, but circumstances are such, that I cannot help earnestly begging you all to come here as soon as possible. I know my dear uncle and aunt so well that I am not afraid of requesting it, though I have still something more to ask of the former. My father is going to London with Colonel Forster instantly, to try to discover her. What he means to do, I am sure I know not; but his excessive distress will not allow him to pursue any measure in the best and safest way, and Colonel Forster is obliged to be at Brighton again to-morrow evening. In such an exigence my uncle's advice and assistance would be every thing in the world; he will immediately comprehend what I must feel, and I rely upon his goodness.";
float fontSizeMax = 10;
float fontSizeMin = 5;
float spacing = 8; // line height
float kerning = 0.3; // between letters

boolean fontSizeStatic = true;

PFont font;
PImage img;

void setup() {
  size(664,1000);
  smooth(); 
  
  font = createFont("Didot",10);
  
  img = loadImage("color.jpg");
}


void draw() {

  background(255);
  textAlign(CENTER);

  float x = 0, y = 10;
  int counter = 0;

  while (y < height) {
    /* BILD = FLÄCHE */
    int imgX = (int) map(x, 0,width, 0,img.width);
    int imgY = (int) map(y, 0,height, 0,img.height);
    /* FARBE */
    color c = img.pixels[imgY*img.width+imgX];

    pushMatrix();
    translate(x, y);

    if (fontSizeStatic) {
      textFont(font, fontSizeMax);
      fill(c);
    } 
    
    char letter = inputText.charAt(counter);
    text(letter, 0, 0);
    float letterWidth = textWidth(letter) + kerning;
    x = x + letterWidth;
    popMatrix();

    /* Zeilenumbruch */
    if (x+letterWidth >= width) {
      x = 0;
      y = y + spacing; // add line height
    }

    counter++;
    if (counter > inputText.length()-1) counter = 0;
  }

  
  }



void keyPressed() { 
  /* RAUF RUNTER */
  if (keyCode == UP) fontSizeMax += 3;
  if (keyCode == DOWN) fontSizeMax -= 3;  
}




