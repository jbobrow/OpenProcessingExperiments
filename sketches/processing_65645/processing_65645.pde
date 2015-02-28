

// Game: starting 

void MainSolitaire() {
  // Die sub MainSolitaire 
  // Einmalige Inits
  NumberSolutions = 0  ;        // Anzahl Lösungen
  intEndstellungenCounter=0;
  Solutions="";  
  boolOnlyHorizontalAndVerticalMovesRequired = true ;   // default: nicht diagonal
  intMaxRichtung = constWesten;                          // default: nicht diagonal
  print ("--------------------------");  // Startzeit eintragen
  print ("Start " + Date1() + ", " + Now1() );
  println ("--------------------------");

  // main part:
  SolveGame();

  print ("--------------------------");
  print ("End " + Date1() + " " + Now1() + "." ); 
  println ("--------------------------");
}

void SolveGame() {

  // Löst das Spiel Solitaire
  //
  String strSpielverlauf;

  // neues Spiel
  DefiniereStartUndZielstellung();

  // zum Protokollieren des Spieles
  // von Anfang bis zur Lösung:
  strSpielverlauf = Join2DArray(SpielfeldGlobal);

  // Hauptteil:
  SpielRekursiv (SpielfeldGlobal, 1, strSpielverlauf);

  // Abschluß
  println ("Solitaire - Spiel beendet.");
  println ("Fertig. Es wurden alle möglichen Spielverläufe von Solitaire untersucht.  " + 
    "Anzahl: " +
    intEndstellungenCounter + 
    ". Lösungen: " + 
    NumberSolutions + ".");
}
//
void DefiniereStartUndZielstellung() {
  // definiert Start- und Zielstellung
  // Pre-Init constZielStellung
  constZielStellung = "";

  if (currentConfiguration==configurationFirePlaceBoard)
  {
    funcStartStellungFireplace();
  }
  else if (currentConfiguration==configurationCrossBoard)
  {
    funcStartStellungCross();
  }
  else if (currentConfiguration==configurationEnglishBoard)
  {
    funcStartStellungEnglish();
  }  
  else 
  {
    println ("Unknown Board, Error 65, tab Game1. Exit +++++++++++++++");
    exit();
  }

  // Prüfe, ob constZielStellung definiert wurde
  CheckconstZielStellung();

  // Startfeld ausgeben
  Output ("Start:  ", SpielfeldGlobal);
  println ("-----------------------------------------------------------------------------");
}
//


