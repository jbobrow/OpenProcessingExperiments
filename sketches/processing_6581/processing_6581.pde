
void clicinter(){
  //Replay affiche les damiers mémorisés
  if (mouseX<630 && mouseY>80 && mouseY<130)
     {replay=true; tir=false; mouveur=false;rejouer(mouseX);}   //mode replay désactive mouveur et tir
  //Charger
  if ( mouseY>155 && mouseY<190)
    {println("Charger"); load(1);} 
  //Sauver
  if (mouseY>200 && mouseY<240)
    {println("Sauver"); sauve(1);}    //sauve les coups depuis ceux joués dans le 1e damier  
}


void clicun(){
    // si on clique une case occupée par un pion,mouveur eteint, on allume le mouveur
    if (!mouveur && (damier[idamier][xcase][ycase] != 0)) {                
       if (damier[idamier][xcase][ycase]/100 ==tour)            //mais seulement si c'est son tour
        {mouveur = true ; xmouveur = xcase; ymouveur = ycase;}}
}


void clicdeux(){
    // si c'est un 2e clic sur une case autour du mouveur, demander de bouger à l'arbitre
    if ( abs(xcase-xmouveur) + abs(ycase-ymouveur) == 1) 
       {arbitre(idamier,xmouveur,ymouveur,xcase,ycase,0,false);}
  // si c'est un 2e clic sur la case du mouveur
    if ((ycase == ymouveur) && (xcase == xmouveur)){
      typ = (damier[idamier][xmouveur][ymouveur] % 100)/10;
      // si c'est un canon et qu'on clique en bas (sa gachette) puis si on n'a pas déjà tiré
      if (typ==6 && balle && (mouseY-ycase*50-xbord+25) > 0) { tir=true;
            arbitre(idamier,xmouveur,ymouveur,xmouveur,ymouveur,0,true);}
       // sinon demander de tourner à l'arbitre
       else {anglem= mouseX-xcase*50-xbord+25; if (anglem != 0){anglem=anglem/(abs(anglem));}
            arbitre(idamier,xmouveur,ymouveur,xmouveur,ymouveur,anglem,false);} //+1Dt -1G 0
       }              
  // si le 2e clic est traité, on eteint tout
    mouveur = false ;  anglem=0;
}

