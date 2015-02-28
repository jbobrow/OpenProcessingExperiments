
//setting the presets
void nineteenSixtyEight() {
  float[] ab = { 
    70, 90, 90, 70, 90, 90, 90, 90, 70, 70, 90, 90, 90, 90, 90, 90, 70, 70, 90, 70, 90, 90, 90, 70, 90, 90, 90, 90, 90, 90, 90, 90, 70, 90, 90, 70,
    90, 90, 90, 70, 90, 70, 70, 90, 90, 70, 90, 90, 90, 90, 90, 90, 90     };
  float[] ba = { 
    70, 90, 90, 70, 90, 90, 90, 90, 70, 70, 90, 90, 90, 90, 90, 90, 70, 70, 90, 70, 90, 90, 90, 70, 90, 90, 90, 90, 90, 90, 90, 90, 70, 90, 90, 70,
    90, 90, 90, 70, 90, 70, 70, 90, 90, 70, 90, 90, 90, 90, 90, 90, 90     };
  float[] ca = { 
    33, 66, 66, 33, 66, 66, 66, 66, 33, 33, 66, 66, 66, 66, 66, 66, 33, 33, 66, 33, 66, 66, 66, 33, 66, 66, 66, 66, 66, 66, 66, 66, 33, 66, 66, 33,
    66, 66, 66, 33, 66, 33, 33, 66, 66, 33, 66, 66, 66, 66, 66, 66, 66     };
  unitedStates = true;
  twoCandidates = false;
  String[] regionNames = { 
    "AL", "AK", "AZ", "AR", "CA", "CO", "CT", "DE", "FL", "GA", "HI", "ID", "IL", "IN", "IA", "KS", "KY", "LA", "ME", "MD", "MA", "MI", "MN", "MS", "MO", "MT", "NE", "NV", 
    "NH", "NJ", "NM", "NY", "NC", "ND", "OH", "OK", "OR", "PA", "RI", "SC", "SD", "TN", "TX", "UT", "VT", "VA", "WA", "WV", "WI", "WY", "DC"         }; 
  if (done == false) {
    numParties = 1;
    numDistricts = 50;
    numCandidates = 3;
    electoral = 1;
    partisana = 42;
    decimala = 7;
    partisanb = 43;
    decimalb = 4;
    partisanc = 13;
    decimalc = 5;
    compositiona = 42.7;
    compositionb = 43.4;
    compositionc = 13.5;
    baselinea = 42.7;
    baselineb = 43.4;
    baselinec = 13.5;
    done = true;
  }

  //if (done2 == false) {
  //42.7, 43.4, 13.5

  //states in alphabetical order (with DC tacked on at end)

  /*String[] states = { 
   AL, AK, AZ, AR, CA, CO, CT, DE, FL, GA, HI, ID, IL, IN, IA, KS, KY, LA, ME, MD, MA, MI, MN, MO, MT, NE, NV, NH, NJ, NM, NY,
   NC, ND, OH, OK, OR, PA, RI, SC, SD, TN, TX, UT, VT, VA, WA, WV, WI, WY, DC     }; */

  float[] regiona = { 
    18.7, 42.6, 35.0, 30.4, 44.7, 41.4, 49.5, 41.6, 30.9, 26.8, 59.8, 30.7, 44.2, 38.0, 40.8, 34.7, 37.6, 28.2, 55.3, 43.6, 63.0, 48.2,
    54.0, 23.0, 43.7, 41.6, 31.8, 39.3, 43.9, 43.4, 39.7, 49.8, 29.2, 38.2, 42.9, 32.0, 43.8, 47.6, 64.0, 29.6, 42.0, 28.1, 41.1, 37.1, 43.5, 32.5, 47.2,
    49.6, 44.3, 35.5, 81.1                                                                                                                    };
  float[] regionb = { 
    14.0, 45.3, 54.8, 30.8, 47.8, 50.5, 44.4, 45.1, 40.5, 30.4, 38.7, 56.8, 47.1, 50.3, 53.0, 54.8, 43.8, 23.5, 43.1, 41.9, 32.9, 41.5,
    41.5, 13.5, 44.9, 50.6, 59.8, 47.5, 52.1, 46.1, 51.8, 44.3, 39.5, 55.9, 45.2, 47.7, 49.9, 44.0, 31.8, 38.1, 53.3, 37.8, 39.9, 56.6, 52.8, 43.4, 45.1,
    40.8, 48.0, 55.8, 18.2                                                                      };
  for (int n = 0; n < 51; n++) {
    regionc[n] = 100.0 - (regiona[n] + regionb[n]);
  }
  for (int i = 0; i < 51; i++) {


    leana[i] = (regiona[i] - baselinea);


    leanb[i] = (regionb[i] - baselineb);
    leanc[i] = (regionc[i] - baselinec);


  }
  for (int i = 0; i < 51; i++) {
    regionTruea[i] = (compositiona + leana[i]);
    regionTrueb[i] = (compositionb + leanb[i]);
    regionTruec[i] = (compositionc + leanc[i]);

  }
  if (callNewWhoWon == true) {
    whoWonThreeCandidates();

  }
  //done2 = true;

}

void redHookOughtEight() {
  unitedStates = false;
  int[] numberofvoters = {
    568, 591, 711, 657, 852, 663, 634, 694                                    };
  twoCandidates = true;
  if (done == false) {
    sys = 0;
    numParties = 0;
    numDistricts = 8;
    numCandidates = 2;
    electoral = 0;
    partisana = 56;
    decimala = 7;
    partisanb = 43;
    decimalb = 3;
    partisanc = 0;
    decimalc = 0;
    partya = 0;
    partyb = 1;
    compositiona = 56.7;
    compositionb = 43.3;
    compositionc = 0.0;
    baselinea = 56.7;
    baselineb = 43.3;
    baselinec = 0.0;
    done = true;

  }
candidateA = "McKeon";
candidateB = "Latimer";
  float[] regiona = { 
    63.2, 49.6, 57.1, 51.6, 89.1, 44.9, 46.2, 52.4             };
  for (int i = 0; i < 8; i++){
    regionb[i] = 100.0 - regiona[i];

  }
  for (int i = 0; i < 8; i++){
    leana[i] = regiona[i] - baselinea;
    leanb[i] = regionb[i] - baselineb;
  }

  if (callNewWhoWon == true) {
    whoWonTwoCandidates();
  }

  for (int i = 0; i < 51; i++) {
    if (whoWon[i] == 0 && whoLost[i] == 1) {
      margin[i] = regionTruea[i] - regionTruec[i];
    } 
    else if (whoWon[i] == 0 && whoLost[i] == 2) {
      margin[i] = regionTruea[i] - regionTrueb[i];
    } 
    else if (whoWon[i] == 1 && whoLost[i] == 0) {
      margin[i] = regionTrueb[i] - regionTruec[i];
    } 
    else if (whoWon[i] == 1 && whoLost[i] == 2) {
      margin[i] = regionTrueb[i] - regionTruea[i];
    } 
    else if (whoWon[i] == 2 && whoLost[i] == 0) {
      margin[i] = regionTruec[i] - regionTrueb[i];
    } 
    else if (whoWon[i] == 2 && whoLost[i] == 1) {
      margin[i] = regionTruec[i] - regionTruea[i];
    }
  }
} 

//figuring out who won if two candidates
void whoWonTwoCandidates() {
  int[] electoralVotes = { 
    10, 3, 5, 6, 40, 6, 8, 3, 14, 12, 4, 4, 26, 13, 9, 7, 9, 10, 4, 10, 14, 21, 10, 7, 12, 4, 5, 3, 4, 17, 4, 43, 13, 4, 26, 8,
    6, 29, 4, 8, 4, 11, 25, 4, 3, 12, 9, 7, 12, 3, 3                                                                                                           }; 
  electorala = 0;
  electoralb = 0;
  for (int i = 0; i < 51; i++) {
    if (regionTruea[i] > regionTrueb[i]) {
      whoWon[i] = 0;
      colorState[i] = 0;
    } 
    else {
      whoWon[i] = 1;
      colorState[i] = 1;
    }

    if (whoWon[i] == 0) {
      electorala = electorala + electoralVotes[i];
      aStates[ha] = states[i];
      if (ha == 51) {
        ha = 0;
      }
      ha++;
    } 
    else if (whoWon[i] == 1) {
      electoralb = electoralb + electoralVotes[i];
      bStates[hb] = states[i];
      if (hb == 51) {
        hb = 0;
      }
      hb++;

    } 
    if(whoWon[i] == 0) {
      margin[i] = regionTruea[i] - regionTrueb[i];
    } 
    else if (whoWon[i] == 1){
      margin[i] = regionTrueb[i] - regionTruea[i];
    }
  }
  

}

//figuring out who won if three candidates
void whoWonThreeCandidates() {
  if (preset == 1) {
    int[] electoralVotes = { 
      10, 3, 5, 6, 40, 6, 8, 3, 14, 12, 4, 4, 26, 13, 9, 7, 9, 10, 4, 10, 14, 21, 10, 7, 12, 4, 5, 3, 4, 17, 4, 43, 13, 4, 26, 8,
      6, 29, 4, 8, 4, 11, 25, 4, 3, 12, 9, 7, 12, 3, 3                                                                                                                     };

    electorala = 0;
    electoralb = 0;
    electoralc = 0;
    for (int i = 0; i < 51; i++) {
      if (electoralSystem[i] == 0) {
        if (regionTruea[i] > regionTrueb[i] && regionTruea[i] > regionTruec[i]) {
          whoWon[i] = 0;
          colorState[i] = 0;
          if (regionTrueb[i] > regionTruec[i]) {
            whoLost[i] = 2;
          } 
          else {
            whoLost[i] = 1;
          }   
        } 

        else if (regionTrueb[i] > regionTruea[i] && regionTrueb[i] > regionTruec[i]) {
          whoWon[i] = 1;
          colorState[i] = 1;
          if (regionTruea[i] > regionTruec[i]) {
            whoLost[i] = 2;
          } 
          else {
            whoLost[i] = 0;
          }
        } 
        else if (regionTruec[i] > regionTruea[i] && regionTruec[i] > regionTrueb[i]) {
          whoWon[i] = 2;
          colorState[i] = 2;
          if (regionTrueb[i] > regionTruea[i]) {
            whoLost[i] = 0;
          } 
          else {
            whoLost[i] = 1;
          }
        }
      }

      //Instant run-off voting. Doesn't change the national composition of the vote as that reflects first choices
      if (electoralSystem[i] == 1) {
        //Mostly arbitrary assumptions here.
        float[] ab = { 
          70, 90, 90, 70, 90, 90, 90, 90, 70, 70, 90, 90, 90, 90, 90, 90, 70, 70, 90, 70, 90, 90, 90, 70, 90, 90, 90, 90, 90, 90, 90, 90, 70, 90, 90, 70,
          90, 90, 90, 70, 90, 70, 70, 90, 90, 70, 90, 90, 90, 90, 90, 90, 90                         };
        float[] ba = { 
          70, 90, 90, 70, 90, 90, 90, 90, 70, 70, 90, 90, 90, 90, 90, 90, 70, 70, 90, 70, 90, 90, 90, 70, 90, 90, 90, 90, 90, 90, 90, 90, 70, 90, 90, 70,
          90, 90, 90, 70, 90, 70, 70, 90, 90, 70, 90, 90, 90, 90, 90, 90, 90                         };
        float[] ca = { 
          33, 66, 66, 33, 66, 66, 66, 66, 33, 33, 66, 66, 66, 66, 66, 66, 33, 33, 66, 33, 66, 66, 66, 33, 66, 66, 66, 66, 66, 66, 66, 66, 33, 66, 66, 33,
          66, 66, 66, 33, 66, 33, 33, 66, 66, 33, 66, 66, 66, 66, 66, 66, 66                         };

       
          electoralSystem[i] = 1;
          ac[i] = 100 - ab[i];
          bc[i] = 100 - ba[i];
          cb[i] = 100 - ca[i];

        
        if (regionTruea[i] < regionTrueb[i] && regionTruea[i] < regionTruec[i]) {
          whoLost[i] = 0;
          regionTrueb[i] = regionTrueb[i] + (regionTruea[i] * (ab[i]/100));
          regionTruec[i] = regionTruec[i] + (regionTruec[i] * (ac[i]/100));
          if (regionTrueb[i] > regionTruec[i]) {
            whoWon[i] = 1;
            colorState[i] = 1;
          } 
          else {
            whoWon[i] = 2;
            colorState[i] = 2;
          }
        }
        if (regionTrueb[i] < regionTruea[i] && regionTrueb[i] < regionTruec[i]) {
          whoLost[i] = 0;
          regionTruea[i] = regionTruea[i] + (regionTruea[i] * (ba[i]/100));
          regionTruec[i] = regionTruec[i] + (regionTruec[i] * (bc[i]/100));
          if (regionTruea[i] > regionTruec[i]) {
            whoWon[i] = 0;
            colorState[i] = 0;
          } 
          else {
            whoWon[i] = 2;
            colorState[i] = 2;
          }
        }
        if (regionTruec[i] < regionTruea[i] && regionTruec[i] < regionTrueb[i]) {
          whoLost[i] = 0;
          regionTruea[i] = regionTruea[i] + (regionTruea[i] * (ca[i]/100));
          regionTrueb[i] = regionTrueb[i] + (regionTrueb[i] * (cb[i]/100));
          if (regionTruea[i] > regionTrueb[i]) {
            whoWon[i] = 0;
            colorState[i] = 0;
          } 
          else {
            whoWon[i] = 1;
            colorState[i] = 1;
          }
        }
      }

      if (whoWon[i] == 0) {
        electorala = electorala + electoralVotes[i];
        aStates[ha] = states[i];
        if (ha == 51) {
          ha = 0;
        }
        ha++;
      } 
      else if (whoWon[i] == 1) {
        electoralb = electoralb + electoralVotes[i];
        bStates[hb] = states[i];
        if (hb == 51) {
          hb = 0;
        }
        hb++;

      } 
      else if (whoWon[i] == 2) {
        electoralc = electoralc + electoralVotes[i];
        cStates[hc] = states[i];
        if (hc == 51) {
          hc = 0;
        }
        hc++;

      }

    }
    for (int i = 0; i < 51; i++) {
      if (whoWon[i] == 0 && whoLost[i] == 1) {
        margin[i] = regionTruea[i] - regionTruec[i];
      } 
      else if (whoWon[i] == 0 && whoLost[i] == 2) {
        margin[i] = regionTruea[i] - regionTrueb[i];
      } 
      else if (whoWon[i] == 1 && whoLost[i] == 0) {
        margin[i] = regionTrueb[i] - regionTruec[i];
      } 
      else if (whoWon[i] == 1 && whoLost[i] == 2) {
        margin[i] = regionTrueb[i] - regionTruea[i];
      } 
      else if (whoWon[i] == 2 && whoLost[i] == 0) {
        margin[i] = regionTruec[i] - regionTrueb[i];
      } 
      else if (whoWon[i] == 2 && whoLost[i] == 1) {
        margin[i] = regionTruec[i] - regionTruea[i];
      }
    }
  }
  //callNewWhoWon = false;
}













































