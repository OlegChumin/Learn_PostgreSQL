В PostgreSQL типы данных char, varchar и text предназначены для хранения текстовой информации, но имеют некоторые отличия:

char: Тип данных char представляет строку фиксированной длины. Он используется для хранения символьных данных заданной
длины. Например, char(10) будет хранить строку фиксированной длины в 10 символов. Если переданная строка короче, она
будет дополнена пробелами до указанной длины. Также известно, что char занимает фиксированное количество пространства в
памяти, даже если хранящаяся строка короче указанной длины.

varchar: Тип данных varchar (от "variable character") представляет строку переменной длины. Он используется для хранения
символьных данных переменной длины. Например, varchar(128) будет хранить строку переменной длины, допускающую до 128
символов. Размер переменной строки будет реально занимаемым размером, а не фиксированным.

text: Тип данных text представляет строку переменной длины без ограничений на размер. Он предназначен для хранения
больших объемов текстовой информации. Тип text может хранить строки произвольной длины без ограничения на размер.

Отличие между varchar и varchar(128) состоит в том, что varchar указывает на переменную длину, но не имеет конкретного
ограничения на размер, в то время как varchar(128) указывает на переменную длину, но с ограничением на размер строки до
128 символов.

В общем случае, если вам нужно хранить строки переменной длины с определенным максимальным размером, вы можете использовать varchar(n), где n - это максимальная длина строки. Если вам необходимо хранить строки без ограничения на размер, используйте тип данных text. Использование char обычно рекомендуется только в случаях, когда вам нужны строки фиксированной длины, чтобы обеспечить одинаковый размер для каждого значения.