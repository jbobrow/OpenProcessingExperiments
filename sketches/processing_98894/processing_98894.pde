
String [ ] adjective = {
  "Super",
  "Oriental",
  "Lucky",
  "Eastern",
  "Double",
  "Chinese",
  "Asian",
};

String [ ] noun = {
  "Club",
  "Noodle",
  "Dumpling",
  "Express",
  "Luck",
  "Star",
  "Dragon",
  "House",
  "Garden",
  "Eastern",
  "Chinese",
  "Asian",
};

String [ ] noun2 = {
  "Palace",
  "Club",
  "Dragon",
  "Panda",
  "Noodles",
  "Express",
  "Dumplings",
  "House",
  "Garden",
  "Tiger"
};

void setup( ) {
  
  size( 400, 400 );
  background( 255 );
  
  fill( 0 );
  textAlign( CENTER, CENTER );
  text( "Press Any Key", width / 2, height / 2 );
  
}

void draw( ) {
  
}

void keyPressed( ) {
  
  fill( 255 );
  noStroke( );
  rect( 0, 0, width, height );
  
  fill( 255, 0, 0 );
  textAlign( CENTER, CENTER );
  text( adjective[ int( random( 0, 6 ) ) ] + " "
  + noun[ int( random( 0, 12 ) ) ] + " "
  + noun2[ int( random( 0, 10 ) ) ], width / 2, height / 2 );
  
}

