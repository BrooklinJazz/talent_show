defmodule Mix.Tasks.CreateStudentsJson do
    use Mix.Task

    def run(_) do
        students = Enum.map(1..100, fn num -> %{name: "student#{num}"} end)
        content = Jason.encode!(students)
        File.write!("./assets/js/students.json", content)
    end
end
