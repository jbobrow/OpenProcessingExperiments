
void setupFrames(){
   switch(frame){
    case 0:
    setupMenu();
    break;
    case 1:
    setupNewGame();
    break;
    case 2:
    setupGame();
    break; 
    case 3:
    setupStore();
    break;  
    case 4:
    setupInventory();
    break;
    case 5:
    setupPrice();
    break;
    case 6:
    setupStats();
    break; 
    case 7:
    setupJournal();
    break;   
    case 8:
    setupUpgrades();
    break;    
    case 9:
    setupLevelUp();
    break; 
    case 10:
    setupLose();
    break; 
    case 11:
    setupHelp();
    break;     
  }
}

