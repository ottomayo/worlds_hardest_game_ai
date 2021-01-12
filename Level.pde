class Level {
  int magnifyer;
  
  int startZone[] = {
    2, 3, 3, 6,
  };
  
  int endZone[] = {
    15, 3, 3, 6,
  };
  
  int normalArea[][] = {
    {5,  8,  2,  1},
    {6,  4,  8,  4},
    {13, 3,  2,  1},
    
    {2, 3, 3, 6,}
  };
  
  int border[][] = {
    {2,  3,  5,  3}, //
    {5,  3,  5,  8}, //
    {5,  8,  6,  8}, //
    {6,  4,  6,  8}, 
    {6,  4,  13, 4}, //
    {13, 3,  13, 4}, 
    {13, 3,  15, 3}, //
    {15, 3,  18, 3}, //
    {18, 3,  18, 9}, 
    {15, 9,  18, 9}, 
    {15, 4,  15, 9}, 
    {14, 4,  15, 4}, //
    {14, 4,  14, 8}, 
    {7,  8,  14, 8}, //
    {7,  8,  7,  9}, 
    {2,  9,  7,  9}, 
    {2,  3,  2,  9}, 
  };
  
  
  Level() {
    // For (800, 600) screen
    magnifyer = 30;
    
    // For fullscreen
    //magnifyer = 90;
    
    
    // Increase all the level layout measurements
    // by a certain magnitude, so it can be drawn 
    // visibly to the screen.
    
    for(int i = 0; i < startZone.length; i++) {
      startZone[i] *= magnifyer;
    }
    for(int i = 0; i < endZone.length; i++) {
      endZone[i] *= magnifyer;
    }
    for(int i = 0; i < normalArea.length; i++) {
      for(int j = 0; j < normalArea[i].length; j++) {
        normalArea[i][j] *= magnifyer;
      }
    }
    for(int i = 0; i < border.length; i++) {
      for(int j = 0; j < border[i].length; j++) {
        border[i][j] *= magnifyer;
      }
    }
  }
  
  
  void draw() {
    
    for(int i = 0; i < normalArea.length; i++) {
      fill(255,255,255);
      stroke(255,255,255);
      rect(normalArea[i][0], normalArea[i][1], normalArea[i][2], normalArea[i][3]);
    }

    fill(0,255,0);
    stroke(0,255,0);
    rect(startZone[0], startZone[1], startZone[2], startZone[3]);
  
    fill(0,255,0);
    stroke(0,255,0);
    rect(endZone[0], endZone[1], endZone[2], endZone[3]);
    
    for(int i = 0; i < border.length; i++) {
      stroke(0);
      line(border[i][0], border[i][1], border[i][2], border[i][3]);
    }
    
  }
  
  
  boolean insideArea(float x, float y) {
    
    //for(int i = 0; i < normalArea.length; i++) {
      
    //  if(x + 10 < normalArea[i][0] + normalArea[i][2] && 
    //     x > normalArea[i][0] && 
    //     y + 10 < normalArea[i][1] + normalArea[i][3] && 
    //     y > normalArea[i][1]) {
           
    //    return true;
        
    //  }
    //}
    
    //return false;
    
    for(int i = 0; i < border.length; i++) {
      
      if(true) {
        // Line in question is horizontal
        
        if(y + 10 >= border[i][1] && y <= border[i][3] && x + 10 >= border[i][0] && x <= border[i][2]) {
          return false;
        }
        
      }
    }
    
    return true;
    
  }
  
  
  boolean touchingGoal(float x, float y) {
    if(x + 10 > endZone[0] && 
       x < endZone[0] + endZone[2] &&
       y + 10 > endZone[1] && 
       y < endZone[1] + endZone[3]) {
         
      return true;
      
    } else {
      return false;
    }
  }

}
