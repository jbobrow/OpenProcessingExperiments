
XMLElement data;

void setup()
{
  size(500,500);
  smooth();
  background(150, 150, 150);

  data = new XMLElement(this, "dataset.xml");
  
  XMLElement[] age = data.getChildren("row/Age");
  XMLElement[] gender = data.getChildren("row/Gender");
  XMLElement[] answer = data.getChildren("row/Answers");
  
  barGraph(age, gender, answer);
}


void barGraph(XMLElement[] ages, XMLElement[] genders, XMLElement[] answers)
{
  for (int i=0; i<ages.length; i++)
  {
    int tAge =int(ages[i].getContent());
    int tGen =int(genders[i].getContent());
    int tAns =int(answers[i].getContent());

    float newHeight = height/2 + (tAns-1)*75;      // top is yes, bottom is no
    fill((tGen-1)*150);                             //gray is male, black is female
    rect(i*width/ages.length, newHeight, 10, -tAge); //age is length of rect
  }
}

