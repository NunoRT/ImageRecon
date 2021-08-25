function final = eliminaCaracteresEspeciais2(alfa)
    final = regexprep(alfa,'[^a-zA-Z0-9]','')';
end

