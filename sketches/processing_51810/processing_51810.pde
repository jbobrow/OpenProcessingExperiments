

 
int myFemaleNames;
 
    String femaleNames [] = {
    "Kathy Bates", "Whoopi Goldberg", "Franca Squarciapino", "Sherry Lansing", "Jodie Foster", 
    "Mercedes Ruehl", "Debra Chasnoff", "Callie Khouri", "Emma Thompson", "Marisa Tomei","Eiko Ishioka",
    "Joan C. Gratz", "Ruth Prawer Jhabvala (not present; accepted by presenters)", 
    "Audrey Hepburn (accepted by her son, Sean Hepburn Ferrer)", "Elizabeth Taylor", "Holly Hunter", "Anna Paquin",
    "Gabriella Pescucci", "Jane Campion", "Deborah Kerr", "Jessica Lange", "Dianne Wiest", "Susan Sarandon", "Mira Sorvino",
    "Emma Thompson", "Frances McDormand", "Juliette Binoche","Ann Roth", "Jessica Yu", "Gwyneth Paltrow", "Judi Dench",
    "Sandy Powell", "Jenny Shircore", "Hilary Swank", "Angelina Jolie",  "Lindy Hemming", "Julia Roberts", "Marcia Gay Harden",
    "Janty Yates", "Tracy Seretean", "Halle Berry", "Jennifer Connelly", "Nicole Kidman", "Catherine Zeta-Jones",  "Colleen Atwood",
    "Charlize Theron", "Renée Zellweger", "Maryann DeLeo", "Sofia Coppola", "Hilary Swank",  "Cate Blanchett", "Sandy Powell", "Thelma Schoonmaker",
    "Andrea Arnold", "Reese Witherspoon", "Rachel Weisz", "Dion Beebe", "Colleen Atwood", "Helen Mirren", "Jennifer Hudson", "Milena Canonero",
    "Thelma Schoonmaker", "Melissa Etheridge", "Torill Kove", "Ari Sandel"};


  String maleNames [] = {
    "Ennio Morricone", "Richard Sylbert and Rick Simpson", "Jeremy Irons", "Joe Pesci", "Kevin Costner", "Neil Travis", 
    "Dean Semler", "John Barry", "Nick Park", "Adam Davidson", "Albert Wolsky", "Jack Palance", "Anthony Hopkins", 
    "Bruce Joel Rubin", "Michael Blake", "Jonathan Demme", "Alan Menken", "Daniel Greaves", "Ted Tally", "Al Pacino", 
    "Gene Hackman", "Philippe Rousselot", "Robert Richardson (not present; accepted by presenter)", "Satyajit Ray", 
    "Steven Spielberg (with live segment from space shuttle Atlantis)", "Clint Eastwood", "Joel Cox", "Alan Menken",
    "Clint Eastwood, Producer", "Sam Karmann (not present; accepted by presenters)", "Neil Jordan", "Federico Fellini",
    "Tom Hanks", "Tommy Lee Jones","Janusz Kaminski", "Steven Spielberg", "Michael Kahn", "John Williams", "Bruce Springsteen", 
    "Nick Park", "Pepe Danquart", "Steven Zaillian", "Paul Newman", "Tom Hanks", "Martin Landau", "John Toll", "Robert Zemeckis",
    "Charles Guggenheim", "Arthur Schmidt", "Hans Zimmer", "Stephen Hunter Flick", "Eric Roth", "Quincy Jones", "Clint Eastwood",
     "Nicolas Cage", "Kevin Spacey", "Eugenio Zanetti", "John Toll", "James Acheson", "Mel Gibson", "Jon Blair", 
     "Luis Enrique Bacalov", "Nick Park", "Christopher McQuarrie", "Kirk Douglas", "Geoffrey Rush", "Cuba Gooding, Jr.", "John Seale"
    , "Anthony Minghella", "Walter Murch", "Stanley Donen", "Roberto Benigni", "James Coburn", "Janusz Kaminski", "Steven Spielberg",
    "Keiko Ibi", "Michael Kahn", "Nicola Piovani", "Stephen Warbeck", "Chris Wedge", "Bill Condon", "Norman Jewison", "Kevin Spacey",
    "Michael Caine", "Conrad L. Hall",  "Sam Mendes", "Zach Staenberg", "John Corigliano", "Phil Collins", "Alexander Petrov",
    "Dane A. Davis", "John Irving", "Alan Ball", "Andrzej Wajda", "Warren Beatty", "Russell Crowe", "Benicio Del Toro", "Tim Yip",
    "Peter Pau", "Steven Soderbergh", "Stephen Mirrione", "Taiwan (accepted by director Ang Lee)", "Tan Dun", "Bob Dylan", 
    "Michael Dudok de Wit", "Florian Gallenberger", "Jon Johnson", "Stephen Gaghan", "Cameron Crowe", "Jack Cardiff", "Ernest Lehman",
    "Dino De Laurentiis", "Denzel Washington", "Jim Broadbent",  "Aron Warner", "Andrew Lesnie", "Ron Howard",  "Pietro Scalia",
    "Bosnia & Herzegovina (accepted by director Danis Tanovic)",  "Howard Shore", "Ralph Eggleston", "Akiva Goldsman","Julian Fellowes",
    "Arthur Hiller", "Sidney Poitier","Robert Redford", "Adrien Brody", "Chris Cooper", "Hayao Miyazaki (not present; accepted by presenter)",
    "Conrad L. Hall (accepted by his son, Conrad W. Hall)", "Roman Polanski (not present; accepted by presenter)", "Martin Walsh",  "Elliot Goldenthal",
    "Martin Richards", "Eric Armstrong", "Ronald Harwood", "Pedro Almodóvar", "Peter O'Toole", "Sean Penn", "Tim Robbins", "Andrew Stanton", "Russell Boyd",
    "Peter Jackson", "Jamie Selkirk", "Howard Shore", "Blake Edwards", "Jamie Foxx", "Morgan Freeman", "Brad Bird", "Robert Richardson", "Clint Eastwood",
    "Jan A.P. Kaczmarek", "Jorge Drexler", "Chris Landreth", "Roger Mayer", "Sidney Lumet", "Philip Seymour Hoffman", "George Clooney", "Ang Lee", 
    "Hughes Winborne", "Gustavo Santaolalla","Martin McDonagh", "Robert Altman", "Forest Whitaker",  "Alan Arkin",  "George Miller", "Guillermo Navarro", 
    "Martin Scorsese", "Gustavo Santaolalla", "Graham King", "William Monahan", "Michael Arndt"};
    
    
 void identifyGender () {

   myFemaleNames = femaleNames.length;
  int myMaleNames = maleNames.length;
  
//  println (myFemaleNames + ",  " + myMaleNames);
ellipseMode (CENTER);
noStroke ();

fill (#FF588D);
ellipse (300, height/2-100, myFemaleNames*3, myFemaleNames*3);
fill (255);
textSize (myFemaleNames);
text ("27%", 235, height/2-80);

fill (#96DBF0);
ellipse (700, height/2+50, myMaleNames*3, myMaleNames*3);
fill (255);
textSize (myMaleNames);
text ("73%", 530, height/2+100); 

textSize (14);
fill (#ADAEAF);
text ("[Data from years" + " " + parsedOutYears [0] + " " + "to" +" "+ parsedOutYears [totalNumofSpeeches-1]+"]", 970, 30);

}




