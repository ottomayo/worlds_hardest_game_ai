class Level {
  int startZone[][] = {
    {10, 10, 100, 100},
  };
  
  int endZone[][] = {
    {690, 490, 100, 100},
  };
  
  int normalArea[][] = {
    //{100, 0, 600, height},
    //{0, 100, width, 400},
    {0, 0, width, height},
  };
  
  
  
  Level(int levelNum) {

    
  }
  
  
  void draw() {
    
    for(int i = 0; i < normalArea.length; i++) {
      fill(255,255,255);
      stroke(255,255,255);
      rect(normalArea[i][0], normalArea[i][1], normalArea[i][2], normalArea[i][3]);
    }
    
    for(int i = 0; i < startZone.length; i++) {
      fill(0,255,0);
      stroke(0,255,0);
      rect(startZone[i][0], startZone[i][1], startZone[i][2], startZone[i][3]);
    }
    
    for(int i = 0; i < endZone.length; i++) {
      fill(0,255,0);
      stroke(0,255,0);
      rect(endZone[i][0], endZone[i][1], endZone[i][2], endZone[i][3]);
    }
    
  }
  
  boolean insideArea(float x, float y) {
    for(int i = 0; i < normalArea.length; i++) {
      if(x + 10 >= normalArea[i][0] + normalArea[i][2] || x <= normalArea[i][0]) {
        return false;
      }
      if(y + 10 >= normalArea[i][1] + normalArea[i][3] || x <= normalArea[i][1]) {
        return false;
      }
      
    }
    
    return true;
    
  }
  
  
  
}
