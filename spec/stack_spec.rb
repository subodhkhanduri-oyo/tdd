describe Stack do

  subject { described_class.new(10) }

  context '#initiaize' do
    context 'when the capacity given is 0' do
      subject { described_class.new(0) }

      it 'creates a new empty stack with 0 capacity Stack object' do
        expect(subject).to be_instance_of(Stack)
        expect(subject.size).to eq(0)
        expect(subject.capacity).to eq(0)
      end
    end

    context 'when a positive numeric capacity is given' do
      it 'creates a new empty stack with the given capacity' do
        expect(subject).to be_instance_of(Stack)
        expect(subject.capacity).to eq(10)
        expect(subject.size).to eq(0)
      end
    end

    context 'when the given capacity is not a positive numeric value' do
      subject { described_class.new(-1) }

      it 'raises InvalidCapacity error' do
        expect { described_class.new(-1) }.to raise_error(described_class::InvalidCapacity)
      end
    end
  end

  context '#push' do
    it 'inserts given element on the top of the stack' do
      subject.push(1)
      expect(subject.size).to eq(1)
    end

    context 'when stack is full to capacity' do
      it 'raises Overflow error' do
        10.times do |index|
          subject.push(index + 1)
        end
        expect { subject.push(10) }.to raise_error(described_class::Overflow)
      end
    end
  end

  context '#pop' do
    it 'removes the top element from the stack' do
      subject.push(2)
      subject.push(3)
      subject.pop
      expect(subject.top).to eq(2)
      expect(subject.size).to eq(1)
    end

    context 'when stack is empty' do
      it 'raises Underflow error' do
        expect { subject.pop }.to raise_error(described_class::Underflow)
      end
    end
  end

end
