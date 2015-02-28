


void pageFive()
{
  
  String[] contact = { 
    "Mission", 
    "", 
    "I wish to lift a business to new levels of effectiveness "
      +"through the better use and understanding of the business "
      +"information and technology.  I enjoy solving problems from "
      +"the strategic to the technical, including gathering information, "
      +"analysing the business, engaging in Project Management, even "
      +"designing templates, reports, and code solutions.  I am happy to "
      +"work in a matrix environment; for me this includes taking "
      +"responsibility for problems, working with diverse teams, and "
      +"creating a positive working environment orientated to quality outputs.",
    "Mr.Adam.Sandell@gmail.com", 
    "", 
    "Telephone:     +44 (0) 794 905 1718", 
    "", 
    "Address:         16 Grange Place", 
    "                       London NW6 4JU", 
    "                       UK", 
    "", 
    "Nationality:    British", 
  };

  textLeading(30); 
  fill(fontColour);

  int gap = 0;
  
  textAlign(CENTER);
  
  for (int i = 0; i < contact.length; i++)
  {
    
    if(i == 3) 
    {
      gap = (int)(height/2.8 - 2*30);
      fill(secondFontColour);
    }
    
    text(contact[i].substring(0,(int)(lerp(0,contact[i].length(),degree))), 50, (int)(lerp(height,125+(30*i)+gap,degree)), width - 100, height - 50);
    
  }
}


