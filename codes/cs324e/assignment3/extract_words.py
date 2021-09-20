from re import findall

def extract():
   novel = open("62873-0.txt", "r", encoding = "utf8")
   all_words = open("allwords.txt", "w")
   unique_words = open("uniquewords.txt", "w")
   word_frequency = open("wordfrequency.txt", "w")

   uniquewords = []
   wordfrequency = []

   for i in range(3327):
      novel_line = (novel.readline()).split()
      for wrd in novel_line:
         wrd = wrd.lower()
         wrd_lst = findall(r"[a-z]+", wrd)
         wrd = ""
         for w in wrd_lst:
            wrd += w
         if wrd == "":
            continue
         elif wrd not in uniquewords:
            uniquewords.append(wrd)
            wordfrequency.append(1)
         else:
            wordfrequency[uniquewords.index(wrd)] += 1
         all_words.write(wrd + "\n")
   
   for i in range(len(uniquewords)):
      if wordfrequency[i] == 1:
         unique_words.write(uniquewords[i] + "\n")
   for wrd in wordfrequency:
      word_frequency.write(str(wrd) + "\n")

   novel.close()
   all_words.close()
   unique_words.close()
   word_frequency.close()

extract()