function word_indices = processEmail(email_contents)

for i = 1:length(vocabList)
  if (strcmp(vocabList{i}, str))
    word_indices = [word_indices; i];
  endif
end

end
