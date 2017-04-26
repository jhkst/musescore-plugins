import QtQuick 2.2
import MuseScore 1.0
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.0

MuseScore {

    property variant circle:   [0, 7, 2, 9, 4, 11, 6, 1, 8, 3, 10, 5]
                             //  0   1    2   3    4   5   6    7   8    9   10   11
    property variant noteName: ["C","C#","D","D#","E","F","F#","G","G#","A","A#","B"]
    // https://en.wikibooks.org/wiki/Music_Theory/Complete_List_of_Chord_Patterns
    // https://github.com/berteh/musescore-chordsToNotes/blob/master/chordsToNotes.qml
    property variant chords: {
        "":[0,4,7], "m":[0,3,7], "7":[0,4,7,10], "m7":[0,3,7,10], "6":[0,4,7,9], "m6":[0,3,7,9],
        "maj7":[0,4,7,11], "dim":[0,3,6], "aug":[0,4,8], "aug7":[0,4,8,10]/*=7+5*/, "dim7":[0,3,6,9],
        "sus2":[0,2,7], "7sus2":[0,2,7,10], "sus4":[0,5,7], "5":[0,7], "m9":[0,2,3,7,10],
        "13":[0,2,4,5,7,9,10], "11":[0,2,4,5,7,10], "9b5":[0,2,4,6,10], "add":[0,2,4,7],
        "6/9":[0,2,4,7,9], "9":[0,2,4,7,10], "maj9":[0,2,4,7,11], "9+5":[0,2,4,8,10], "9sus4":[0,2,5,7,10], 
        "9sus2":[0,2,7,10],/*=7sus2*/ "m11":[0,3,5,7,10], "m7b5":[0,3,6,10], "m13":[0,3,7,9,10],
        "m(maj7)":[0,3,7,11], "7b5":[0,4,6,10], "maj13":[0,4,7,9,11], "7+5":[0,4,8,10], "7sus4":[0,5,7,10]
    }
    property variant scale: {
        "major":                [0,2,4,5,7,9,11],
        "natural minor":        [0,2,3,5,7,8,10],
        "harmonic minor":       [0,2,3,5,7,8,11],
        "melodic minor":        [0,2,3,5,7,9,11],
        "major pentatonic":     [0,2,4,7,9],
        "minor pentatonic":     [0,3,5,7,10],
        "blues":                [0,3,5,6,7,10],
        "minor blues":          [0,2,3,5,6,7,8,10],
        "major blues":          [0,2,3,4,5,6,7,9,10],
        "augmented":            [0,2,4,6,8,10],
        "diminished":           [0,2,3,5,6,8,9,11],
        "phrygian-dominant":    [0,1,4,5,7,8,10],
        "dorian":               [0,2,3,5,7,9,10],
        "phrygian":             [0,1,3,5,7,8,10],
        "lydian":               [0,2,4,6,7,9,11],
        "mixolydian":           [0,2,4,5,7,9,10],
        "locrian":              [0,1,3,5,6,8,10],
        "jazz melodic minor":   [0,2,3,5,7,9,11],
        "dorian b2":            [0,1,3,5,7,9,10],
        "lydian augmented":     [0,2,4,6,8,9,11],
        "lydian b2":            [0,2,4,6,7,9,10],
        "mixolydian b13":       [0,2,4,5,7,8,10],
        "locrian #2":           [0,2,3,5,6,8,10],
        "super locrian":        [0,1,3,4,6,8,10],
        "whole half diminished":[0,2,3,5,6,8,9,11],
        "half whole diminished":[0,1,3,4,6,7,9,10],
        "enigmatic":            [0,1,4,6,8,10,11],
        "double harmonic":      [0,1,4,5,7,8,11],
        "hungarian minor":      [0,2,3,6,7,8,11],
        "persian":              [0,1,4,5,6,8,11],
        "arabian":              [0,2,4,5,6,8,10],
        "japanese":             [0,1,5,7,8],
        "egyptian":             [0,2,5,7,10],
        "hirajoshi":            [0,2,3,7,8]
    }

    function getType(type) {
        switch(type) {
           case Element.INVALID: return "INVALID";
           case Element.BRACKET_ITEM: return "BRACKET_ITEM";
           case Element.PART: return "PART";
           case Element.STAFF: return "STAFF";
           case Element.SCORE: return "SCORE";
           case Element.SYMBOL: return "SYMBOL";
           case Element.TEXT: return "TEXT";
           case Element.INSTRUMENT_NAME: return "INSTRUMENT_NAME";
           case Element.SLUR_SEGMENT: return "SLUR_SEGMENT";
           case Element.TIE_SEGMENT: return "TIE_SEGMENT";
           case Element.STAFF_LINES: return "STAFF_LINES";
           case Element.BAR_LINE: return "BAR_LINE";
           case Element.SYSTEM_DIVIDER: return "SYSTEM_DIVIDER";
           case Element.STEM_SLASH: return "STEM_SLASH";
           case Element.LINE: return "LINE";
           case Element.ARPEGGIO: return "ARPEGGIO";
           case Element.ACCIDENTAL: return "ACCIDENTAL";
           case Element.LEDGER_LINE: return "LEDGER_LINE";
           case Element.STEM: return "STEM";
           case Element.NOTE: return "NOTE";
           case Element.CLEF: return "CLEF";
           case Element.KEYSIG: return "KEYSIG";
           case Element.AMBITUS: return "AMBITUS";
           case Element.TIMESIG: return "TIMESIG";
           case Element.REST: return "REST";
           case Element.BREATH: return "BREATH";
           case Element.REPEAT_MEASURE: return "REPEAT_MEASURE";
           case Element.TIE: return "TIE";
           case Element.ARTICULATION: return "ARTICULATION";
           case Element.CHORDLINE: return "CHORDLINE";
           case Element.DYNAMIC: return "DYNAMIC";
           case Element.BEAM: return "BEAM";
           case Element.HOOK: return "HOOK";
           case Element.LYRICS: return "LYRICS";
           case Element.FIGURED_BASS: return "FIGURED_BASS";
           case Element.MARKER: return "MARKER";
           case Element.JUMP: return "JUMP";
           case Element.FINGERING: return "FINGERING";
           case Element.TUPLET: return "TUPLET";
           case Element.TEMPO_TEXT: return "TEMPO_TEXT";
           case Element.STAFF_TEXT: return "STAFF_TEXT";
           case Element.SYSTEM_TEXT: return "SYSTEM_TEXT";
           case Element.REHEARSAL_MARK: return "REHEARSAL_MARK";
           case Element.INSTRUMENT_CHANGE: return "INSTRUMENT_CHANGE";
           case Element.STAFFTYPE_CHANGE: return "STAFFTYPE_CHANGE";
           case Element.HARMONY: return "HARMONY";
           case Element.FRET_DIAGRAM: return "FRET_DIAGRAM";
           case Element.BEND: return "BEND";
           case Element.TREMOLOBAR: return "TREMOLOBAR";
           case Element.VOLTA: return "VOLTA";
           case Element.HAIRPIN_SEGMENT: return "HAIRPIN_SEGMENT";
           case Element.OTTAVA_SEGMENT: return "OTTAVA_SEGMENT";
           case Element.TRILL_SEGMENT: return "TRILL_SEGMENT";
           case Element.TEXTLINE_SEGMENT: return "TEXTLINE_SEGMENT";
           case Element.VOLTA_SEGMENT: return "VOLTA_SEGMENT";
           case Element.PEDAL_SEGMENT: return "PEDAL_SEGMENT";
           case Element.LYRICSLINE_SEGMENT: return "LYRICSLINE_SEGMENT";
           case Element.GLISSANDO_SEGMENT: return "GLISSANDO_SEGMENT";
           case Element.LAYOUT_BREAK: return "LAYOUT_BREAK";
           case Element.SPACER: return "SPACER";
           case Element.STAFF_STATE: return "STAFF_STATE";
           case Element.NOTEHEAD: return "NOTEHEAD";
           case Element.NOTEDOT: return "NOTEDOT";
           case Element.TREMOLO: return "TREMOLO";
           case Element.IMAGE: return "IMAGE";
           case Element.MEASURE: return "MEASURE";
           case Element.SELECTION: return "SELECTION";
           case Element.LASSO: return "LASSO";
           case Element.SHADOW_NOTE: return "SHADOW_NOTE";
           case Element.TAB_DURATION_SYMBOL: return "TAB_DURATION_SYMBOL";
           case Element.FSYMBOL: return "FSYMBOL";
           case Element.PAGE: return "PAGE";
           case Element.HAIRPIN: return "HAIRPIN";
           case Element.OTTAVA: return "OTTAVA";
           case Element.PEDAL: return "PEDAL";
           case Element.TRILL: return "TRILL";
           case Element.TEXTLINE: return "TEXTLINE";
           case Element.TEXTLINE_BASE: return "TEXTLINE_BASE";
           case Element.NOTELINE: return "NOTELINE";
           case Element.LYRICSLINE: return "LYRICSLINE";
           case Element.GLISSANDO: return "GLISSANDO";
           case Element.BRACKET: return "BRACKET";
           case Element.SEGMENT: return "SEGMENT";
           case Element.SYSTEM: return "SYSTEM";
           case Element.COMPOUND: return "COMPOUND";
           case Element.CHORD: return "CHORD";
           case Element.SLUR: return "SLUR";
           case Element.ELEMENT: return "ELEMENT";
           case Element.ELEMENT_LIST: return "ELEMENT_LIST";
           case Element.STAFF_LIST: return "STAFF_LIST";
           case Element.MEASURE_LIST: return "MEASURE_LIST";
           case Element.HBOX: return "HBOX";
           case Element.VBOX: return "VBOX";
           case Element.TBOX: return "TBOX";
           case Element.FBOX: return "FBOX";
           case Element.ICON: return "ICON";
           case Element.OSSIA: return "OSSIA";
           case Element.BAGPIPE_EMBELLISHMENT: return "BAGPIPE_EMBELLISHMENT";
           case Element.MAXTYPE: return "MAXTYPE";
        }
    }

    function fw(duration) {
        return duration.numerator + "/" + duration.denominator + "(" + duration.ticks + ")";
    }

    function arrEq(arr1, arr2, add, mod) {
        return arr1.length==arr2.length && arr1.every(function(v,i) { return v === arr2[i]; })
    }

    function arrAdd(arr, add, mod) {
        var out = arr.map(function(e) {return (e + add) % mod;});
        out.sort(function(a,b){return a-b})
        return out;
    }

    function arrToString(arr) {
        var out = "";
        for(var k in arr) {
           if(out.hasOwnProperty(k))
              out += arr + ",";
        }
        return out;
    }

    function getKey(flatsharps, isMajor) {
       if(isMajor) {
          return circle[(flatsharps + 12) % 12]
       } else {
          return circle[(flatsharps + 15) % 12];
       }
    }

    function diatonicFunction() { //http://webhouse.cz/kurz-harmonie/harmonicke_funkce.htm https://en.wikipedia.org/wiki/Diatonic_function
       var tonic = 0;            //I
       var dominant = 7;         //V    dur[7,7/5+,9,11,13] mol[7,9-,11/9-]
       var subdominant = 5;      //IV   [6,7]
       var supertonic = 2;       //II   [
       var submediant = 9;       //VI
       var mediant = 4;          //III
       var leadingTone = 11;     //VII
       
    }

    function getNoteName(pitch) {
        return noteName[pitch % 12] + (Math.floor(pitch / 12)-1);
    }

    function getChord(pitches) {
       var base = [];

       for(var i = 0; i < pitches.length; i++) {
           if(base.indexOf(pitches[i] % 12) < 0) {
               base.push(pitches[i] % 12);
           }
       }

       base.sort(function(a,b){return a-b});

       for(var k in chords) {
           if(chords.hasOwnProperty(k)) {
               for(var add = 0; add < 12; add++) {
                   var tst = arrAdd(chords[k], add, 12);
                   if(arrEq(tst, base)) {
                       return noteName[add] + k;
                   }
               }
           }
       }
       if(base.length == 0) {
           return null;
       }
      return null;
//       return "[" + base.map(function(x){ return noteName[x];}) + "]";
    }

    menuPath: "Plugins.chord recognition"
    onRun: {
 
        if (typeof curScore === 'undefined') {
            console.log("Please open a score before calling execution this plugin.");
            Qt.quit();
        }
        console.log("=======");

        var tickHeap = [];
        var cursors = [];
        var currentTicks = 0;
        for(var t = 0; t < curScore.ntracks; t++) {
            var c = curScore.newCursor();
            c.rewind(0);
            c.track = t;
            cursors.push(c);
            tickHeap.push(0);
        }

        for(var j = 0; j < 100; j++) {
            console.log("---- " + j);

            var minTicks = currentTicks + 1000000;

            var pitches = [];

            for(var t = 0; t < curScore.ntracks; t++) {
//                console.log(cursors[t].track + " " + cursors[t].element + " " + (cursors[t].element ? getType(cursors[t].element.type) : "null"));
                if(cursors[t].element) {
                   if(cursors[t].element.type == Element.CHORD) {
                       var notes = cursors[t].element.notes;
                       var cnt = notes.length;
                       for(var i = 0; i < cnt; i++) {
                          console.log(notes[i].pitch + ": " + getNoteName(notes[i].pitch));
                          pitches.push(notes[i].pitch);
                       }
                   }
                   if(cursors[t].element.duration) {
                       console.log("Duration: " + fw(cursors[t].element.duration));
                       var cTicks = cursors[t].element.duration.ticks;
                       if(tickHeap[t] + cTicks < minTicks) {
                           minTicks = tickHeap[t] + cTicks;
                       } 
//                       console.log("Global Duration: " + fw(cursors[t].element.globalDuration));
                   }
                }
            }     

            var ch = getChord(pitches);
            console.log("Chord: " + ch);

            for(var t = 0; t < curScore.ntracks; t++) {
               if(cursors[t].element && cursors[t].element.duration) {
                   var cTicks = cursors[t].element.duration.ticks;
                   if(tickHeap[t] + cTicks <= minTicks) {
                      tickHeap[t] += cTicks;

                      if(ch) {
                          var text = newElement(Element.STAFF_TEXT);  
                          text.pos.x = 0;
                          text.pos.y = 0;
                          text.text = ch;
                          cursors[t].add(text);

                       }
                       cursors[t].next();
                   }
               }
            }

            currentTicks = minTicks;
 
            console.log("----" + currentTicks);
        }
/*
        var cc = 0;

        while(cc<20) {
            console.log(cursor.segment ? Object.keys(cursor.segment) : "null");
            if(cursor.segment) {
                  console.log(curScore.ntracks);
                  console.log(cursor.element.type);


                  var segnotes = [];

                  for(var track = 0; track < curScore.ntracks; track++) {            
                      cursor.voice = track % 4;
                      cursor.staffIdx = Math.floor(track / 4);
                      var element = cursor.element;
                      if(element && element.type == Element.CHORD) {
                          var notes = element.notes;
                          for(var i = 0; i < notes.length; i++) {
                              segnotes.push(notes[i].pitch);
                          }
                      }
                  }
                  var ch = getChord(segnotes);
                  if(ch && false) {
                      var text = newElement(Element.STAFF_TEXT);
                      text.pos.x = 0;
                      text.pos.y = 0;
                      text.text = ch;
//                      cursor.track = 0;
//                      cursor.add(text);
                  }
            }

            cursor.next();
//            console.log(cursor.segment ? cursor.segment : "null");
            cc++;
        }*/

        Qt.quit();
    }
    StatusBar {
        RowLayout {
            anchors.fill: parent
            Label { text: "Read Only" }
        }
    }
}

